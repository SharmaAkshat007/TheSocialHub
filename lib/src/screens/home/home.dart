import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:petStore/src/screens/home/homeScreen/feed.dart';
import 'package:petStore/src/screens/home/postFormScreen/postForm.dart';
import 'package:petStore/src/screens/home/profileScreen/user.dart';
import 'package:petStore/src/widgets/loading.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _screenNumber;

  @override
  void initState() {
    super.initState();
    _screenNumber = 0;
  }

  final List<Widget> _screens = [Feed(), PostForm(), User()];

  void onTabTapped(int index) {
    setState(() {
      _screenNumber = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: FirebaseAuth.instance.currentUser(),
          builder: (BuildContext context, AsyncSnapshot user) {
            if (user.connectionState == ConnectionState.waiting) {
              return Loading();
            } else {
              return Scaffold(
                body: _screens[_screenNumber],
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.purple,
                  unselectedItemColor: Colors.black,
                  iconSize: 28,
                  elevation: 20.0,
                  currentIndex: _screenNumber,
                  onTap: onTabTapped,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                          size: 30,
                        ),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.add,
                          size: 30,
                        ),
                        label: "Add"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.person,
                          size: 30,
                        ),
                        label: "Profile"),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

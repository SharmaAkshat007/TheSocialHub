import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petStore/src/widgets/loading.dart';
import 'feed.dart';
import 'postForm.dart';
import 'user.dart';

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
                  selectedItemColor: Colors.purple,
                  unselectedItemColor: Colors.black,
                  iconSize: 28,
                  elevation: 0.0,
                  backgroundColor: Colors.purple[50],
                  currentIndex: _screenNumber,
                  onTap: onTabTapped,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                        ),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.add,
                        ),
                        label: "Add"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.person,
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

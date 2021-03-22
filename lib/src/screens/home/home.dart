import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petStore/services/authService.dart';
import 'package:petStore/src/widgets/loading.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome : ${user.data.email.toString()}',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                        color: Colors.purple,
                        child: Text('Log Out'),
                        onPressed: () async {
                          Auth().signOut();

                          Navigator.pushReplacementNamed(context, '/login');
                        }),
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

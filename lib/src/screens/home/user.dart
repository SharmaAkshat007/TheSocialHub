import 'package:flutter/material.dart';
import 'package:petStore/services/authService.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Profile Screen'),
          FlatButton(
            onPressed: () async {
              await Auth().signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Text(
              'Signout',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.purple[400],
          ),
        ],
      ),
    );
  }
}

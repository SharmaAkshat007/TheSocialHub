import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text('SignUp'),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}

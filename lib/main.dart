//import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petStore/services/authService.dart';
import 'package:petStore/src/screens/home/home.dart';
import 'package:petStore/src/screens/wrapper.dart';
import 'src/screens/authenticate/login.dart';
import 'src/screens/authenticate/signup.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: Auth().user,
      child: MaterialApp(
        title: 'Pet Store',
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (context) => Wrapper(),
              );
              break;
            case '/login':
              return MaterialPageRoute(
                builder: (context) => Login(),
              );
              break;
            case '/signup':
              return MaterialPageRoute(
                builder: (context) => SignUp(),
              );
              break;
            case '/home':
              return MaterialPageRoute(
                builder: (context) => Home(),
              );
              break;
            default:
              return null;
          }
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

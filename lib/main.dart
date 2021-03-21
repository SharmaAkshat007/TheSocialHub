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
        routes: {
          '/': (context) => Wrapper(),
          '/login': (context) => Login(),
          '/signup': (context) => SignUp(),
          '/home': (context) => Home(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

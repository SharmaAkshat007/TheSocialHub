import 'package:flutter/material.dart';
import 'src/screens/login.dart';
import 'src/screens/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Store',
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/signup': (context) => SignUp(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

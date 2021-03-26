import 'package:flutter/material.dart';
import 'package:petStore/services/authService.dart';
import '../../widgets/customShape.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CustomPaint(
          painter: Shape(),
        ),
      ),
    );
  }
}

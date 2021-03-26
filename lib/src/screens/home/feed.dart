import 'package:flutter/material.dart';
import 'package:petStore/src/widgets/post.dart';
import '../../widgets/customShape.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          overflow: Overflow.visible,
          children: [
            CustomPaint(
              size: Size(deviceWidth, deviceHeight * 0.25),
              painter: CurvePainter(),
            ),
            Post(),
          ],
        ),
      ),
    );
  }
}

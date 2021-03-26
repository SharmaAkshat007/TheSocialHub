import 'package:flutter/material.dart';
import 'package:petStore/src/widgets/post.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "The Social Hub",
          style: TextStyle(
              color: Colors.purple, fontSize: 23, fontWeight: FontWeight.w600),
        ),
        elevation: 5,
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        actions: [
          IconButton(
            color: Colors.purple,
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Post(),
            SizedBox(height: 10),
            Post(),
            SizedBox(height: 10),
            Post(),
            SizedBox(height: 10),
            Post(),
          ],
        ),
      ),
    );
  }
}

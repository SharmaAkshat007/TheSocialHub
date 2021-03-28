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
            tooltip: "Message",
            splashColor: Colors.purple[100],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Post(postIndex: index);
        },
      ),
    );
  }
}

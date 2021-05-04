import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petStore/services/dbService.dart';
import 'package:petStore/src/widgets/loading.dart';
import 'package:petStore/src/widgets/post.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    return StreamBuilder(
        stream: DbService(uid: user.uid).getPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Loading();
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "The Social Hub",
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 23,
                      fontWeight: FontWeight.w600),
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
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Post(
                      caption: snapshot.data[index].caption,
                      date: snapshot.data[index].date,
                      postImage: snapshot.data[index].postImage);
                },
              ),
            );
          }
        });
  }
}

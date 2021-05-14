import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget imageTile(DocumentSnapshot post) {
  return Image(
    image: NetworkImage(post.data['postImage']),
  );
}

class Grid extends StatelessWidget {
  final currentPosts;

  Grid({this.currentPosts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return imageTile(currentPosts[index]);
      },
      itemCount: currentPosts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.75,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0),
    );
  }
}

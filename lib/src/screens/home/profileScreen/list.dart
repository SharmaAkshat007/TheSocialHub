import 'package:flutter/material.dart';
import 'package:petStore/src/widgets/post.dart';

class ScrollList extends StatelessWidget {
  final currentPosts;

  ScrollList({this.currentPosts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currentPosts.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Post(post: currentPosts[index]);
      },
    );
  }
}

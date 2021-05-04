import 'package:flutter/material.dart';
import 'package:petStore/src/widgets/post.dart';

class ScrollList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Post();
      },
    );
  }
}

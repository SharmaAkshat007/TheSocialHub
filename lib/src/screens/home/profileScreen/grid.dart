import 'package:flutter/material.dart';

Widget imageTile(int index) {
  return index % 2 == 0
      ? Image(image: AssetImage('assets/images/elon.jpg'))
      : Image(
          image: AssetImage('assets/images/tesla.jpg'),
        );
}

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return imageTile(index);
      },
      itemCount: 51,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1.5),
    );
  }
}

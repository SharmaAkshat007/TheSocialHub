import 'package:flutter/cupertino.dart';

class Post {
  final String caption;
  final date;
  final String name;
  final String postImage;
  final String profileImage;
  final String userUid;

  Post(
      {@required this.caption,
      @required this.date,
      @required this.name,
      @required this.postImage,
      @required this.profileImage,
      @required this.userUid});
}

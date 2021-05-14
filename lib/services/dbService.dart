import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:petStore/services/storageService.dart';
import 'package:petStore/models/userModel.dart';

class DbService {
  final String uid;

  DbService({this.uid});

  final CollectionReference user = Firestore.instance.collection("User");

  final CollectionReference post = Firestore.instance.collection("Post");

  // User

  Stream<UserModel> get data {
    return user.document(uid).snapshots().map((doc) {
      return UserModel(
          name: doc.data['name'], profileImage: doc.data['profileImage']);
    });
  }

  Future updateUserData(String name, File image) async {
    dynamic url =
        await StorageService(profileImage: image, folderName: "ProfileImages")
            .uploadImage();

    return await user
        .document(uid)
        .setData({"name": name, "profileImage": url});
  }

  // Post
  Stream<QuerySnapshot> get posts {
    return post.snapshots();
  }

  Future updatePostData(String caption, var date, File postImage, String name,
      String profileImage) async {
    dynamic url =
        await StorageService(profileImage: postImage, folderName: "PostImages")
            .uploadImage();
    return await post.document().setData({
      "caption": caption,
      "date": date,
      'postImage': url,
      'user_uid': uid,
      'name': name,
      "profileImage": profileImage,
    });
  }
}

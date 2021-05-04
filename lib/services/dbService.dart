import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petStore/models/postModel.dart';

import 'dart:io';
import 'package:petStore/services/storageService.dart';

class DbService {
  final String uid;

  DbService({this.uid});

  final CollectionReference user = Firestore.instance.collection("User");

  final CollectionReference post = Firestore.instance.collection("Post");

  Stream<QuerySnapshot> get data {
    return user.snapshots();
  }

  Future updateUserData(String name, File image) async {
    dynamic url =
        await StorageService(profileImage: image, folderName: "ProfileImages")
            .uploadImage();

    return await user
        .document(uid)
        .setData({"name": name, "profileImage": url});
  }

  Stream<DocumentSnapshot> getUserData() {
    return user.document(uid).snapshots();
  }

  Future updatePostData(String caption, var date, File postImage) async {
    dynamic url =
        await StorageService(profileImage: postImage, folderName: "PostImages")
            .uploadImage();
    return await post.document().setData(
        {"caption": caption, "date": date, 'postImage': url, 'user_uid': uid});
  }

  List<Post> _postData(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Post(
          caption: doc['caption'],
          date: doc['date'],
          postImage: doc['postImage']);
    }).toList();
  }

  Stream<List<Post>> getPosts() {
    return post.snapshots().map(_postData);
  }
}

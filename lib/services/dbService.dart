import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:petStore/services/storageService.dart';

class DbService {
  final String uid;

  DbService({this.uid});

  final CollectionReference user = Firestore.instance.collection("User");

  Stream<QuerySnapshot> get data {
    return user.snapshots();
  }

  Future updateUserData(String name, File image) async {
    dynamic url = await StorageService(profileImage: image).uploadImage();

    return await user
        .document(uid)
        .setData({"name": name, "profileImage": url});
  }
}

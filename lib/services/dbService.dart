import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:petStore/services/storageService.dart';
import 'package:petStore/models/userModel.dart';

class DbService {
  final String uid;

  DbService({this.uid});

  final CollectionReference user = Firestore.instance.collection("User");

  Stream<List<Users>> get data {
    return user.snapshots().map(_userData);
  }

  List<Users> _userData(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Users(
          name: doc.data['name'] ?? '',
          profileImage: doc.data['profileImage'] ?? '');
    }).toList();
  }

  Future updateUserData(String name, File image) async {
    dynamic url = await StorageService(profileImage: image).uploadImage();

    return await user
        .document(uid)
        .setData({"name": name, "profileImage": url});
  }

  Stream<DocumentSnapshot> getData(String documentID) {
    return user.document(documentID).snapshots();
  }
}

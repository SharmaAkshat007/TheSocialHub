import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;

class StorageService {
  final File profileImage;

  StorageService({this.profileImage});

  Future uploadImage() async {
    try {
      String filePath = "ProfileImages/" + Path.basename(profileImage.path);
      final StorageReference storageReference =
          FirebaseStorage().ref().child(filePath);
      final StorageUploadTask uploadTask =
          storageReference.putFile(profileImage);
      await uploadTask.onComplete;

      final ref = FirebaseStorage().ref().child(filePath);
      dynamic imageString = await ref.getDownloadURL();
      return imageString;
    } catch (err) {
      print(err.message);
    }
  }
}

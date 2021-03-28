import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PickImage {
  Future<File> captureImage(bool fromCamera) async {
    if (fromCamera) {
      final pickedFile = await ImagePicker().getImage(
        source: ImageSource.camera,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        return null;
      }
    } else {
      final pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        return null;
      }
    }
  }
}

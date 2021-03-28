import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petStore/services/imagePicker.dart';

class PostForm extends StatefulWidget {
  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () async {
              File image = await PickImage().captureImage(true);

              if (image != null) {
                setState(() {
                  _image = image;
                });
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.drive_folder_upload),
            onPressed: () async {
              dynamic image = await PickImage().captureImage(false);

              if (image != null) {
                setState(() {
                  _image = image;
                });
              }
            },
          ),
          _image == null
              ? Center(
                  child: Text('Image not found'),
                )
              : Image.file(_image, height: 300, width: 300),
        ]),
      ),
    );
  }
}

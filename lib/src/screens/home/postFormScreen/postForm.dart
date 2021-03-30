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
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: _image != null
            ? Image.file(
                _image,
                fit: BoxFit.contain,
                width: _deviceWidth,
                height: _deviceHeight,
              )
            : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: _deviceWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        splashColor: Colors.purple[100],
                        icon: Icon(
                          Icons.add,
                          size: 28,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Camera or Photos"),
                                  actions: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: Colors.purple,
                                      ),
                                      onPressed: () async {
                                        File image = await PickImage()
                                            .captureImage(true);

                                        if (image != null) {
                                          setState(() {
                                            _image = image;
                                          });
                                          Navigator.pop(context);
                                        }
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.drive_folder_upload,
                                        color: Colors.purple,
                                      ),
                                      onPressed: () async {
                                        dynamic image = await PickImage()
                                            .captureImage(false);

                                        if (image != null) {
                                          setState(() {
                                            _image = image;
                                          });
                                          Navigator.pop(context);
                                        }
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Colors.purple,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Upload an Image',
                        style: TextStyle(fontSize: 20, color: Colors.purple),
                      ),
                    ],
                  ),
                ),
              ]),
      ),
    );
  }
}

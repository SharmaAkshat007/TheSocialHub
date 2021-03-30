import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petStore/services/imagePicker.dart';

class PostForm extends StatefulWidget {
  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  File _image;

  void dialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Camera or Photos",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.normal,
              ),
            ),
            elevation: 30.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0, bottom: 5.0),
                child: IconButton(
                  splashColor: Colors.purple[100],
                  color: Colors.purple[400],
                  icon: Icon(
                    Icons.camera_alt,
                  ),
                  onPressed: () async {
                    File image = await PickImage().captureImage(true);

                    if (image != null) {
                      setState(() {
                        _image = image;
                      });
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0, bottom: 5.0),
                child: IconButton(
                  color: Colors.purple[400],
                  splashColor: Colors.purple[100],
                  icon: Icon(
                    Icons.photo,
                  ),
                  onPressed: () async {
                    dynamic image = await PickImage().captureImage(false);

                    if (image != null) {
                      setState(() {
                        _image = image;
                      });
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0, bottom: 5.0),
                child: IconButton(
                  color: Colors.purple[400],
                  splashColor: Colors.purple[100],
                  icon: Icon(
                    Icons.cancel,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: _image != null
            ? Column(
                children: [
                  Image.file(
                    _image,
                    fit: BoxFit.contain,
                    width: _deviceWidth,
                    height: _deviceHeight * 0.8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: dialog,
                        iconSize: 30,
                        color: Colors.purple[400],
                        splashColor: Colors.purple[100],
                        icon: Icon(Icons.redo),
                      ),
                      IconButton(
                        onPressed: () {},
                        iconSize: 30,
                        color: Colors.purple[400],
                        splashColor: Colors.purple[100],
                        icon: Icon(Icons.done),
                      ),
                    ],
                  ),
                ],
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
                        onPressed: dialog,
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

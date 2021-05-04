import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petStore/services/authService.dart';
import 'package:petStore/src/widgets/loading.dart';
import '../../../models/signUpModel.dart';
import 'package:petStore/services/imagePicker.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _form = GlobalKey<FormState>();

  final SignUpUser user =
      new SignUpUser(name: '', email: '', password: '', confirmPassword: '');

  File dp;

  bool _showValue;

  bool _showError;

  bool _loading;

  bool _firebaseError;
  bool _fileUploaded;

  final name = TextEditingController();
  final emailId = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();

  @override
  void initState() {
    super.initState();

    _showError = false;
    _showValue = false;
    _loading = false;
    _firebaseError = false;
    _fileUploaded = false;
  }

  @override
  void dispose() {
    emailId.dispose();
    password.dispose();
    confirmpassword.dispose();
    name.dispose();
    super.dispose();
  }

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
                        dp = image;
                        _fileUploaded = true;
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
                        dp = image;
                        _fileUploaded = true;
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
    return (_loading
        ? Loading()
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'SignUp',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(height: 20),
                      _showError == true
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  iconSize: 22,
                                  splashColor: Colors.red[200],
                                  color: Colors.red,
                                  onPressed: () {
                                    setState(() {
                                      _showError = false;
                                    });
                                  },
                                  icon: Icon(Icons.cancel_sharp),
                                ),
                                Text(
                                  _firebaseError
                                      ? 'Email already exits or password too weak'
                                      : 'Please upload your Profile Picture',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 15),
                                ),
                              ],
                            )
                          : Text(''),
                      SizedBox(height: 10),
                      Form(
                        key: _form,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                controller: name,
                                cursorColor: Colors.purple,
                                onChanged: (val) {
                                  setState(() {
                                    user.name = val;
                                  });
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  prefixIcon: Icon(Icons.account_circle_sharp,
                                      color: Colors.purple),
                                  errorStyle: TextStyle(fontSize: 13),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                controller: emailId,
                                cursorColor: Colors.purple,
                                onChanged: (val) {
                                  setState(() {
                                    user.email = val;
                                  });
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your email id';
                                  } else if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(user.email)) {
                                    return 'Please enter a valid email id';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  prefixIcon:
                                      Icon(Icons.email, color: Colors.purple),
                                  errorStyle: TextStyle(fontSize: 13),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                controller: password,
                                obscureText: !_showValue,
                                cursorColor: Colors.purple,
                                onChanged: (val) {
                                  setState(() {
                                    user.password = val;
                                  });
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  prefixIcon:
                                      Icon(Icons.lock, color: Colors.purple),
                                  errorStyle: TextStyle(fontSize: 13),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                cursorColor: Colors.purple,
                                onChanged: (val) {
                                  setState(() {
                                    user.confirmPassword = val;
                                  });
                                },
                                obscureText: !_showValue,
                                controller: confirmpassword,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please confirm your password';
                                  } else if (user.password != value) {
                                    return 'Both passwords do not match';
                                  }

                                  return null;
                                },
                                style: TextStyle(fontSize: 20.0),
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  prefixIcon:
                                      Icon(Icons.lock, color: Colors.purple),
                                  errorStyle: TextStyle(fontSize: 13),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.file_upload),
                              color: Colors.black,
                              onPressed: dialog,
                              tooltip: 'Add Image',
                              splashColor: Colors.purple[100],
                            ),
                            Text(
                              'Select your Profile Picture',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: 50),
                            _fileUploaded
                                ? Icon(
                                    Icons.done,
                                    color: Colors.green,
                                  )
                                : Text('')
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            Checkbox(
                              value: _showValue,
                              activeColor: Colors.purple,
                              onChanged: (bool value) {
                                setState(() {
                                  _showValue = value;
                                });
                              },
                            ),
                            Text(
                              'Show Password',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FlatButton(
                        onPressed: () async {
                          if (_form.currentState.validate()) {
                            if (dp == null) {
                              setState(() {
                                _showError = true;

                                _firebaseError = false;
                              });
                            } else {
                              user.profileImage = dp;
                              setState(() {
                                _loading = true;
                              });
                              dynamic resultUser = await Auth()
                                  .registerWithEmailAndPassword(
                                      user.name,
                                      user.email,
                                      user.password,
                                      user.profileImage);

                              if (resultUser == null) {
                                setState(() {
                                  _showError = true;
                                  _firebaseError = true;
                                  _loading = false;
                                });
                              } else {
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              }
                              emailId.clear();
                              password.clear();
                              confirmpassword.clear();
                              name.clear();
                            }
                          }
                        },
                        child: Text(
                          'SignUp',
                          style: TextStyle(fontSize: 18),
                        ),
                        minWidth: 150,
                        color: Colors.purple[400],
                        height: 37,
                        splashColor: Colors.purple[500],
                        padding: EdgeInsets.only(
                            right: 20, left: 20, top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 6),
                          FlatButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                            child: Text(
                              'Login!',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w800),
                            ),
                            splashColor: Colors.purple[200],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
  }
}

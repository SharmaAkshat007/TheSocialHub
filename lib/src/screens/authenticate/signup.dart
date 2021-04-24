import 'package:flutter/material.dart';
import 'package:petStore/services/authService.dart';
import 'package:petStore/src/widgets/loading.dart';
import '../../../models/signUp.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _form = GlobalKey<FormState>();

  final SignUpUser user =
      new SignUpUser(name: '', email: '', password: '', confirmPassword: '');

  bool _showValue;

  bool _showError;

  bool _loading;
  final name = TextEditingController();
  final emailId = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    error = "Email already exists or password too weak!";
    _showError = false;
    _showValue = false;
    _loading = false;
  }

  String error;
  @override
  void dispose() {
    emailId.dispose();
    password.dispose();
    confirmpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (_loading
        ? Loading()
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 70),
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
                                  error,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 15),
                                ),
                              ],
                            )
                          : Text(''),
                      SizedBox(height: 20),
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
                        height: 20,
                      ),
                      FlatButton(
                        onPressed: () async {
                          if (_form.currentState.validate()) {
                            setState(() {
                              _loading = true;
                            });
                            dynamic resultUser = await Auth()
                                .registerWithEmailAndPassword(
                                    user.name, user.email, user.password);

                            if (resultUser == null) {
                              print(user.name);
                              setState(() {
                                _showError = true;
                                _loading = false;
                              });
                            } else {
                              Navigator.pushReplacementNamed(context, '/login');
                            }
                            emailId.clear();
                            password.clear();
                            confirmpassword.clear();
                            name.clear();
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
                      SizedBox(height: 25),
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

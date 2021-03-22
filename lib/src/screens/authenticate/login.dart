import 'package:flutter/material.dart';
import 'package:petStore/services/authService.dart';
import '../../../models/loginModel.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  final LoginUser user = new LoginUser(email: '', password: '');

  final emailId = TextEditingController();
  final password = TextEditingController();

  String error;

  bool _showValue;

  bool _showError;

  @override
  void initState() {
    super.initState();
    error = "Incorrect Email and Password!";
    _showError = false;
    _showValue = false;
  }

  @override
  void dispose() {
    emailId.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Login',
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
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                        ],
                      )
                    : Text(''),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
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
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.purple,
                            ),
                            errorStyle: TextStyle(fontSize: 13),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.purple),
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
                            prefixIcon: Icon(Icons.lock, color: Colors.purple),
                            errorStyle: TextStyle(fontSize: 13),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.purple),
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
                    if (_formkey.currentState.validate()) {
                      dynamic resultUser = await Auth()
                          .signInWithEmailAndPassword(
                              user.email, user.password);

                      if (resultUser == null) {
                        setState(() {
                          _showError = true;
                        });
                      } else {
                        Navigator.pushReplacementNamed(context, '/home');
                      }

                      emailId.clear();
                      password.clear();
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                  minWidth: 150,
                  color: Colors.purple[400],
                  height: 37,
                  splashColor: Colors.purple[500],
                  padding:
                      EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 6),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/signup');
                      },
                      child: Text(
                        'Sign Up!',
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

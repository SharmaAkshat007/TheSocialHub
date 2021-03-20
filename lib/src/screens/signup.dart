import 'package:flutter/material.dart';
import '../../models/signUp.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _form = GlobalKey<FormState>();

  final SignUpUser user =
      new SignUpUser(email: '', password: '', confirmPassword: '');

  final emailId = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: Colors.purple[100],
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 29),
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
              SizedBox(
                height: 15,
              ),
              Form(
                key: _form,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: TextFormField(
                        controller: emailId,
                        cursorColor: Colors.purple,
                        autofocus: true,
                        onChanged: (val) {
                          user.email = val;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your email id';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Email ID',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          errorStyle: TextStyle(fontSize: 13),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: TextFormField(
                        controller: password,
                        obscureText: true,
                        cursorColor: Colors.purple,
                        onChanged: (val) {
                          user.password = val;
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
                          errorStyle: TextStyle(fontSize: 13),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: TextFormField(
                        cursorColor: Colors.purple,
                        onChanged: (val) {
                          user.confirmPassword = val;
                        },
                        obscureText: true,
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
                          errorStyle: TextStyle(fontSize: 13),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 29,
              ),
              FlatButton(
                onPressed: () {
                  if (_form.currentState.validate()) {
                    print(user.email);
                    print(user.password);
                    print(user.confirmPassword);
                    emailId.clear();
                    password.clear();
                    confirmpassword.clear();
                  }
                },
                child: Text(
                  'SignUp',
                  style: TextStyle(fontSize: 18),
                ),
                color: Colors.purple[400],
                height: 37,
                splashColor: Colors.purple[500],
              ),
              SizedBox(height: 5),
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
                      Navigator.popAndPushNamed(context, '/');
                    },
                    child: Text(
                      'Login!',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    splashColor: Colors.purple[200],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import '../../models/loginModel.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  LoginUser user = new LoginUser(email: '', password: '');

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: Colors.purple[100],
      body: SafeArea(
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
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: TextFormField(
                        cursorColor: Colors.purple,
                        autofocus: true,
                        onChanged: (val) {
                          user.email = val;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter username or email id';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Username or Email ID',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          errorStyle: TextStyle(fontSize: 15),
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
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: TextFormField(
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
                          errorStyle: TextStyle(fontSize: 15),
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
                height: 30,
              ),
              FlatButton(
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    print(user.email);
                    print(user.password);
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                ),
                color: Colors.purple[400],
                height: 37,
                splashColor: Colors.purple[500],
              ),
              SizedBox(height: 20),
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
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      'Sign Up!',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    splashColor: Colors.purple[200],
                  ),
                ],
              ),
              // FlatButton(
              //   onPressed: () {},
              //   child: Text('Forgot Password',
              //       style:
              //           TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              //   splashColor: Colors.purple[200],
              // ),
            ],
          ),
        ),
      ),
    ));
  }
}

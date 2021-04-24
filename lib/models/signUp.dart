import 'dart:io';

class SignUpUser {
  String name;
  String email;
  String password;
  String confirmPassword;
  File profileImage;

  SignUpUser(
      {this.name,
      this.email,
      this.password,
      this.confirmPassword,
      this.profileImage});
}

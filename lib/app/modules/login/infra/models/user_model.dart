import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:petshop_app/app/modules/login/domain/entities/user_logged.dart';
import 'package:petshop_app/app/modules/login/domain/entities/user_logged_info.dart';
import 'package:meta/meta.dart';

class UserModel extends UserLogged implements UserLoggedInfo {
  UserModel({@required String name, String email, String phoneNumber})
      : super(name: name, email: email, phoneNumber: phoneNumber);

  factory UserModel.fromBack4App(ParseUser parseUser) {
    return UserModel(
        name: parseUser.username,
        email: parseUser.emailAddress,
        phoneNumber: "1999999");
  }
  UserLogged toLoggedUser() => this;
}

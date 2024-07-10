import 'package:flutter/material.dart';
import 'package:masmas/src/auth/model/user_model.dart';

class AuthVM extends ChangeNotifier {
  UserModel userModel = UserModel();

  List<UserModel> user = [];
  void addUserDetail(
    String email,
  ) {
    user.add(UserModel(
      email: email,
    ));
  }

  void addUserName(name) {
    user.add(UserModel(name: name));
  }

  void update() {
    notifyListeners();
  }
}
//First replace profile screen with consumer
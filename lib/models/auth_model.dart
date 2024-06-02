import 'dart:convert';

import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier{
  bool _isLogin = false;
  Map<String, dynamic> user = {};

  bool get isLogin{
    return _isLogin;
  }

  Map<String, dynamic> get getUser{
    return user;
  }

  void loginSuccess(
    Map<String, dynamic> userdata, 
    //Map<String, dynamic> appointmentInfo
    ){
      _isLogin = true;
      user = userdata;

      notifyListeners();
    }
}
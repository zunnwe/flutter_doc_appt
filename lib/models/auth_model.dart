import 'dart:convert';

import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier{
  bool _isLogin = false;

  bool get isLogin{
    return _isLogin;
  }

  void loginSuccess(
    // Map<String, dynamic> userdata, Map<String, dynamic> appointmentInfo
    ){
      _isLogin = true;

      notifyListeners();
    }
}
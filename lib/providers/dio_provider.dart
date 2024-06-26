import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioProvider{

  Future<dynamic> getToken(String email, String pwd) async{
    try{
      var response = await Dio().post('http://127.0.0.1:8000/api/login',
      data: {'email': email, 'password': pwd});
      
      if(response.statusCode == 200 && response.data != ''){
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data);
        return true;
      }else{
        return false;
      }
    }catch(error){
      return error;
    }
  }

  Future<dynamic> getUser(String token) async{
    try{

      var user = await Dio().get('http://127.0.0.1:8000/api/user',
      options: Options(headers: {'Authorization': 'Bearer $token'}));

      if(user.statusCode == 200 && user.data != ''){
        return json.encode(user.data);
      }
    }catch(error){
      return error;
    }
  }

  Future<dynamic> registerUser(
    String username, String email, String password) async{
      try{

        var user = await Dio().post('http://127.0.0.1:8000/api/register',
          data: {'name': username, 'email': email, 'password': password});
          if(user.statusCode == 201 && user.data != ''){
            return true;
          }else{
            return false;
          }
      }catch(error){
        return error;
      }
    }
}
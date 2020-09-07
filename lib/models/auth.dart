import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Auth {
  String name;
  String email;
  String signupUrl;
  String loginUrl;
  String password;

  Dio dio = new Dio(BaseOptions(
    contentType: Headers.jsonContentType, responseType: ResponseType.json,));

  Auth({this.name, this.password, this.email, this.signupUrl, this.loginUrl});

  String ErrorCheck(error){
    switch (error.response.statusCode) {
      case 400:
        Map<String, dynamic> map = jsonDecode(error.response.toString());
        print(map['errors']);
        return map['errors'];
      case 401:
        Map<String, dynamic> map = jsonDecode(error.response.toString());
        print(map['msg']);
        return map['msg'];
      case 500:
        return "Server Error";
    }
  }
  void LoggedInUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
  }
  Future <String> Signup() async {
    try {
      Response response = await dio.post(signupUrl, data: {
        "name": name,
        "email": email,
        "password": password,
      });
      print(response.data['_id']);
      var jsonResponse = response.toString();

      if (response.statusCode == 200) {
        LoggedInUser();
        return "Success";
      }
    } catch (error) {
      ErrorCheck(error);
    }
  }


  Future <String> Login() async {
    try {
      Response response = await dio.post(loginUrl, data: {
        "email": email,
        "password": password,
      });
      print(response.data['_id']);
      if (response.statusCode == 200) {
        LoggedInUser();
        return "Success";
      }
    } catch (error) {
      ErrorCheck(error);
    }
  }
}



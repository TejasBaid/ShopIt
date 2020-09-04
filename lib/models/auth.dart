import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Auth {
  String name;
  String email;
  String signupUrl;
  String loginUrl;
  String password;

  Dio dio = new Dio(BaseOptions(contentType: Headers.jsonContentType,responseType: ResponseType.json,));

  Auth({this.name,this.password,this.email,this.signupUrl,this.loginUrl});

  Future <String> Signup() async{
    try {
      Response response = await dio.post(signupUrl, data: {
        "name":name,
        "email":email,
        "password": password,
      });

      var statusCode = response.statusCode.toString();
      var js = response.toString();

      if(statusCode == "401" || statusCode == "400"){
        Map<String, dynamic> map = jsonDecode(js);
        return map['msg'];
      }else if(statusCode == "200"){
        return "Success";
      }

    }catch(error){
      print(error.toString());
    }
  }
  Future <String> Login() async{
    try{
      Response response = await dio.post(loginUrl,data: {
        "email":"tejasbaid3@gmail.com",
        "password":"1234567",
      });
      var statusCode = response.statusCode.toString();
      var js = response.toString();

      if(statusCode == "401" || statusCode == "400"){
        Map<String, dynamic> map = jsonDecode(js);
        return map['msg'];
      }else if(statusCode == "200"){
        return "Success";
      }

    }catch(error){
      print(error.toString());
    }
  }


}
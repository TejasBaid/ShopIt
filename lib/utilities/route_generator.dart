import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shopitapp/main.dart';
import 'package:shopitapp/pages/login.dart';
import 'package:shopitapp/pages/signup.dart';

class RouteGenerator {
  static Route <dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupPage());
      case '/login' :
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
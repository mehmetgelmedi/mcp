import 'package:flutter/material.dart';
import 'package:mcp/pages/home-page.dart';
import 'package:mcp/pages/login-page.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    HomePage.tag: (context) => HomePage(),
    LoginPage.tag : (context) => LoginPage(),
  };

  static getMainPage(){
    return LoginPage();
  }
}
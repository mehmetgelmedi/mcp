import 'package:flutter/material.dart';
import 'package:mcp/controllers/user-controller.dart';

class RegisterPage extends StatefulWidget {
  static String tag = 'register-page';
  @override
  State<StatefulWidget> createState() {
    return new RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userController = new UserController();
  @override
  Widget build(BuildContext context) {
    return null;
  }
}

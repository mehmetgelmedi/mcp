import 'dart:developer';
import 'package:mcp/services/user-service.dart';

class UserController {
  UserService _userService = new UserService();
  Future<bool> login(email, password) async {
    // API Call json convert etc. model user
    log('data: $email, $password');
    var response = await this._userService.login(email, password);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  register(email, password) {
    return true; // success
  }
}

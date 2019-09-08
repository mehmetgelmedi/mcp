import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mcp/constant/endpoint.ts';

class UserService {
  static String host = Endpoint['Host']['ReqRes'];
  Future<http.Response> login(String email, String password) async {
    print("$email, $password");
    Map payload = {"email": email, "password": password};
    var body = json.encode(payload);
    print("$body");
    var response = await http.post(host + Endpoint['Auth']['Login'],
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.body}");
    return response;
  }

  Future<http.Response> register(String email, String password) async {
    Map payload = {"email": email, "password": password};
    var body = json.encode(payload);
    var response = await http.post(host + Endpoint['Auth']['Register'],
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.body}");
    return response;
  }
}

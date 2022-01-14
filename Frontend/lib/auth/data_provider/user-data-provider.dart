import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_learn_client/auth/models/user.dart';
import 'package:http/http.dart' as http;

class UserDataProvider {
  static final String _baseUrl = "http://10.0.2.2:3000/auth";

  Future<bool> signup(User user) async {
    print("repository signup : ${user.username}");
    // Post the new user the route /auth/signup
    final http.Response response =
        await http.post(Uri.parse(_baseUrl + "/signup"),
            headers: <String, String>{"Content-Type": "application/json"},
            body: jsonEncode({
              "username": user.username,
              "email": user.email,
              "password": user.password,
              "roles": user.roles
            }));

    if (response.statusCode != 200) {
      return false;
    } else {
      return true;
    }
  }

  Future<User> login(User user) async {
    final http.Response response = await http.post(
        Uri.parse(_baseUrl + "/login"),
        headers: <String, String>{"Content-Type": "application/json"},
        body:
            jsonEncode({"username": user.username, "password": user.password}));
    // handle the login response here
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var parse = jsonDecode(response.body);

      await prefs.setString('accessToken', parse["accessToken"]);
      return User.fromJson(parse);
    } else {
      return User();
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_management/utils/constants/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future login(data) async {
    try {
      final response = await http.post(
        Uri.parse(LOGIN_ENDPOINT),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        var data = jsonDecode(response.body);
        // Store Token
        await prefs.setString('token', data['token']);
        // Store User Information
        await prefs.setString('user', jsonEncode(data['user']));
        print("Token and user data saved!");

        return {"success": true, "data": jsonDecode(response.body)};
      } else {
        return {
          "success": false,
          "error": jsonDecode(response.body)["message"]
        };
      }
    } catch (e) {
      return {"success": false, "error": e.toString()};
    }
  }
}

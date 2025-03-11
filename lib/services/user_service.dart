import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  static Future<Map<String, dynamic>> addUser(
      String url, Map<String, dynamic> data) async {
    try {
      print("Sending request to: $url");
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode(data),
      );

      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"success": true, "data": jsonDecode(response.body)};
      } else {
        return {
          "success": false,
          "error": jsonDecode(response.body)["message"]
        };
      }
    } catch (e) {
      print("Error: $e");
      return {"success": false, "error": e.toString()};
    }
  }
}

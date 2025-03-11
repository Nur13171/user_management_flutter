import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:user_management/utils/constants/api.dart';

class UserService {
  // Fetch token from SharedPreferences
  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

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

  static Future<Map<String, dynamic>> userList() async {
    String token = await getToken();

    try {
      final response = await http.get(
        Uri.parse(USER_LIST_ENDPOINT),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token", // Add token here
        },
      );

      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        // Parse the response body as JSON
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

  // Function to delete user
  static Future<Map<String, dynamic>> deleteUser(int userId) async {
    String token = await getToken(); // Get the authentication token

    try {
      final response = await http.delete(
        Uri.parse("$DELETE_USER_ENDPOINT/$userId"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        return {"success": true, "message": "User deleted successfully"};
      } else {
        return {
          "success": false,
          "error":
              jsonDecode(response.body)["message"] ?? "Failed to delete user"
        };
      }
    } catch (e) {
      return {"success": false, "error": e.toString()};
    }
  }


  // Fetch user details
  static Future<Map<String, dynamic>> getUserDetails(int userId) async {
    String token = await getToken();
    try {
      final response = await http.get(
        Uri.parse("$USER_DETAIL_ENDPOINT/$userId"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        return {"success": true, "data": jsonDecode(response.body)};
      } else {
        return {"success": false, "error": jsonDecode(response.body)["message"]};
      }
    } catch (e) {
      return {"success": false, "error": e.toString()};
    }
  }


// Update User Function
  static Future<Map<String, dynamic>> updateUser(int userId, String name, String email) async {
    try {
      // Retrieve token from shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';

      final response = await http.put(
        Uri.parse("$BASE_URL/users/$userId"),  // Endpoint for updating user
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "name": name,
          "email": email,
        }),
      );

      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        return {"success": true, "message": jsonDecode(response.body)["message"]};
      } else {
        return {"success": false, "error": jsonDecode(response.body)["message"]};
      }
    } catch (e) {
      print("Error: $e");
      return {"success": false, "error": e.toString()};
    }
  }

}

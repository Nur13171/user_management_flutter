import 'package:user_management/services/auth_service.dart';

class AuthController {
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    Map<String, dynamic> loginData = {
      "email": email,
      "password": password,
    };

    return await AuthService.login(loginData);
  }
}

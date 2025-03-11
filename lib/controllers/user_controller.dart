import 'package:user_management/services/user_service.dart';
import 'package:user_management/utils/constants/api.dart';

import '../models/user_model.dart';

class UserController {
  static Future<Map<String, dynamic>> addUser(UserModel user) async {
    return await UserService.addUser(REGISTER_ENDPOINT, user.toJson());
  }


}

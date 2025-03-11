class UserModel {
  String username;
  String email;
  String password;
  String role;

  UserModel({
    required this.username,
    required this.email,
    required this.password, required this.role,
  });

  // Convert user data to JSON format
  Map<String, dynamic> toJson() {
    return {
      "name": username,
      "email": email,
      "password": password,
      "password_confirmation": password,
      "role" : role
    };
  }
}

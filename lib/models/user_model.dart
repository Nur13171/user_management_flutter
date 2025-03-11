class UserModel {
  String username;
  String email;
  String password;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
  });

  // Convert user data to JSON format
  Map<String, dynamic> toJson() {
    return {
      "name": username,
      "email": email,
      "password": password,
      "password_confirmation": password
    };
  }
}

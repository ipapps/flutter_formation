import 'dart:convert';

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json["name"], json["email"]);
  }

  String encodeJson() {
    Map<String, dynamic> json = {
      "name": name,
      "email": email,
    };
    return jsonEncode(json);
  }
}

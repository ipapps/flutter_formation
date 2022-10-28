import 'dart:convert';

import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 2)
class UserList extends HiveObject {

  @HiveField(0)
  final List<User> userList;

  UserList(this.userList);
}

@HiveType(typeId: 1)
class User extends HiveObject {

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  User(this.name, this.email);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json["name"],
      json["email"],
    );
  }

  String encodeJson() {
    Map<String, dynamic> json = {
      "name": name,
      "email": email,
    };
    return jsonEncode(json);
  }
}

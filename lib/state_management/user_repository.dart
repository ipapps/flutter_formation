import 'dart:convert';

import 'package:flutter_formation/webservices/api.dart';
import 'package:flutter_formation/webservices/api_response.dart';
import 'package:flutter_formation/webservices/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UsersRepository {
  Future<ApiResponse<List<User>>> fetchUsers({bool wrong = false});

  Future<List<User>> loadUsers();
}

class MockUsersRepository extends UsersRepository {
  @override
  Future<ApiResponse<List<User>>> fetchUsers({bool wrong = false}) async {
    return ApiResponse([User("David", "ceo@ipapps.dev")], null);
  }

  @override
  Future<List<User>> loadUsers() async {
    return [];
  }
}

class APIUsersRepository extends UsersRepository {
  @override
  Future<ApiResponse<List<User>>> fetchUsers({bool wrong = false}) async {
    final ApiResponse<List<User>> apiResponse;
    if (wrong) {
      apiResponse = await API().fetchWrongUsers();
    } else {
      apiResponse = await API().fetchUsers();
    }
    _saveUsers(apiResponse.response ?? []);
    return apiResponse;
  }

  _saveUsers(List<User> users) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setStringList("users", users.map((e) => e.encodeJson()).toList());
  }

  @override
  Future<List<User>> loadUsers() async {
    final preferences = await SharedPreferences.getInstance();
    final userList = preferences.getStringList("users") ?? [];
    return userList.map((e) => User.fromJson(jsonDecode(e))).toList();
  }
}

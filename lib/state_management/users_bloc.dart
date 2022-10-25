import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_formation/state_management/users_state.dart';
import 'package:flutter_formation/webservices/api.dart';
import 'package:flutter_formation/webservices/api_response.dart';
import 'package:flutter_formation/webservices/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersBloc extends Cubit<UsersState> {
  UsersBloc() : super(UsersState());

  Future<void> fetchUsers({bool wrong = false}) async {
    emit(LoadingUsers());
    final ApiResponse<List<User>> apiResponse;
    if (wrong) {
      apiResponse = await API().fetchWrongUsers();
    } else {
      apiResponse = await API().fetchUsers();
    }
    if (apiResponse.response != null) {
      emit(UsersFetched(apiResponse.response!));
    } else {
      emit(UsersError(apiResponse.error));
    }
    _saveUsers(apiResponse.response ?? []);
  }

  loadUsers() async {
    final preferences = await SharedPreferences.getInstance();
    final userList = preferences.getStringList("users") ?? [];
    emit(UsersFetched(userList.map((e) => User.fromJson(jsonDecode(e))).toList()));
  }

  _saveUsers(List<User> users) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setStringList("users", users.map((e) => e.encodeJson()).toList());
  }
}

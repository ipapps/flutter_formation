import 'package:flutter_formation/webservices/user.dart';

class UsersState {}

class UsersFetched extends UsersState {
  final List<User> users;

  UsersFetched(this.users);
}

class UsersError extends UsersState {
  final Exception? error;

  UsersError(this.error);
}

class LoadingUsers extends UsersState {}
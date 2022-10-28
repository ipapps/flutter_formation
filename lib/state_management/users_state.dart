import 'package:flutter_formation/webservices/user.dart';

enum UserStatus {
  initial,
  loading,
  error,
  done,
}

class UsersState {
  final List<User>? users;
  final Exception? error;
  final UserStatus status;

  UsersState(this.users, this.error, this.status);

  UsersState copyWith(
    UserStatus status, {
    List<User>? users,
    Exception? error,
  }) {
    return UsersState(users, error, status);
  }
}

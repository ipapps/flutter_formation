import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_formation/state_management/user_repository.dart';
import 'package:flutter_formation/state_management/users_event.dart';
import 'package:flutter_formation/state_management/users_state.dart';

// class UsersBloc extends Cubit<UsersState> {
//   final UsersRepository repository;
//
//   UsersBloc(this.repository) : super(UsersState(null, null, UserStatus.initial));
//
//   Future<void> fetchUsers({bool wrong = false}) async {
//     emit(state.copyWith(UserStatus.loading));
//     final apiResponse = await repository.fetchUsers(wrong: wrong);
//     if (apiResponse.response != null) {
//       emit(state.copyWith(UserStatus.done, users: apiResponse.response!));
//     } else {
//       emit(state.copyWith(UserStatus.error, error: apiResponse.error));
//     }
//   }
//
//   loadUsers() async {
//     final users = await repository.loadUsers();
//     emit(state.copyWith(UserStatus.done, users: users));
//   }
// }

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepository repository;

  UsersBloc(this.repository) : super(UsersState(null, null, UserStatus.initial)) {
    on<FetchUsers>((event, emit) => _fetchUsers(wrong: event.wrong, emit));
    on<LoadUsers>((_, emit) => _loadUsers(emit));
  }

  Future<void> _fetchUsers(Emitter<UsersState> emit, {bool wrong = false}) async {
    emit(state.copyWith(UserStatus.loading));
    final apiResponse = await repository.fetchUsers(wrong: wrong);
    if (apiResponse.response != null) {
      emit(state.copyWith(UserStatus.done, users: apiResponse.response!));
    } else {
      emit(state.copyWith(UserStatus.error, error: apiResponse.error));
    }
  }

  Future<void> _loadUsers(Emitter<UsersState> emit) async {
    final users = await repository.loadUsers();
    emit(state.copyWith(UserStatus.done, users: users));
  }
}

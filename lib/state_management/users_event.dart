class UsersEvent {}

class FetchUsers extends UsersEvent {
  final bool wrong;

  FetchUsers({this.wrong = false});
}

class LoadUsers extends UsersEvent {}
import 'package:flutter/material.dart';
import 'package:flutter_formation/webservices/user.dart';

class UserList extends StatelessWidget {
  final List<User> users;

  const UserList(this.users, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return const Center(
        child: Text("Pas d'utilisateurs"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].name),
            subtitle: Text(users[index].email),
          );
        },
        itemCount: users.length,
      );
    }
  }
}

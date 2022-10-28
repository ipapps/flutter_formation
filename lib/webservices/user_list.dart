import 'package:flutter/material.dart';
import 'package:flutter_formation/webservices/user.dart';

class UserListView extends StatelessWidget {
  final List<User> users;

  const UserListView(this.users, {Key? key}) : super(key: key);

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
            leading: Icon(Icons.pedal_bike),
            onTap: () {
              print(users[index].name);
            },
            tileColor: index % 2 == 0 ? Colors.grey[200] : Colors.transparent,
          );
        },
        itemCount: users.length,
      );
    }
  }
}

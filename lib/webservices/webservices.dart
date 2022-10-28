import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_formation/webservices/api.dart';
import 'package:flutter_formation/webservices/api_response.dart';
import 'package:flutter_formation/webservices/hive_repository.dart';
import 'package:flutter_formation/webservices/loader.dart';
import 'package:flutter_formation/webservices/user.dart';
import 'package:flutter_formation/webservices/user_list.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebServicesApp extends StatefulWidget {
  const WebServicesApp({Key? key}) : super(key: key);

  @override
  State<WebServicesApp> createState() => _WebServicesState();
}

class _WebServicesState extends State<WebServicesApp> {

  bool _loading = false;
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  loadUsers() async {
    final preferences = await SharedPreferences.getInstance();
    final userList = preferences.getStringList("users") ?? [];
    setState(() {
      _users = userList.map((e) => User.fromJson(jsonDecode(e))).toList();
    });
  }

  saveUsers() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setStringList("users", _users.map((e) => e.encodeJson()).toList());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: SafeArea(
          child: _loading ? Loader() : UserListView(_users),
        ),
        appBar: AppBar(
          title: Text("Web services"),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () async {
                await fetchUsers(API().fetchUsers);
              },
              child: Icon(Icons.refresh),
            ),
            SizedBox(width: 10,),
            FloatingActionButton(
              onPressed: () async {
                await fetchUsers(API().fetchWrongUsers);
              },
              child: Icon(Icons.clear),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchUsers(Future<ApiResponse<List<User>>> Function() fetchFunction) async {
    setState(() {
      _loading = true;
    });
    _users = (await fetchFunction.call()).response ?? [];
    saveUsers();
    setState(() {
      _loading = false;
    });
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_formation/webservices/api.dart';
import 'package:flutter_formation/webservices/api_response.dart';
import 'package:flutter_formation/webservices/loader.dart';
import 'package:flutter_formation/webservices/user.dart';
import 'package:flutter_formation/webservices/user_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebServicesAppFutureBuilder extends StatefulWidget {
  const WebServicesAppFutureBuilder({Key? key}) : super(key: key);

  @override
  State<WebServicesAppFutureBuilder> createState() => _WebServicesState();
}

class _WebServicesState extends State<WebServicesAppFutureBuilder> {
  Future<ApiResponse<List<User>>> Function()? _fetchFunction;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        body: Builder(builder: (context) {
          return SafeArea(
            child: FutureBuilder<ApiResponse<List<User>>>(
              future: _fetchFunction?.call(),
              builder: (builder, asyncSnapshot) {
                switch (asyncSnapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                    return const Loader();
                  case ConnectionState.done:
                    if (asyncSnapshot.hasData) {
                      if (asyncSnapshot.data!.response != null) {
                        return UserList(asyncSnapshot.data!.response!);
                      } else {
                        Future.microtask(
                          () => ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Une erreur est survenue : ${asyncSnapshot.data!.error!}",
                              ),
                            ),
                          ),
                        );
                        return const UserList([]);
                      }
                    } else {
                      return const UserList([]);
                    }
                  case ConnectionState.none:
                    return const UserList([]);
                }
              },
            ),
          );
        }),
        appBar: AppBar(
          title: const Text("State management Future"),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () async {
                await fetchUsers(API().fetchUsers);
              },
              child: const Icon(Icons.refresh),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () async {
                await fetchUsers(API().fetchWrongUsers);
              },
              child: const Icon(Icons.clear),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchUsers(Future<ApiResponse<List<User>>> Function() fetchFunction) async {
    setState(() {
      _fetchFunction = fetchFunction;
    });
  }
}

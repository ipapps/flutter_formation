import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_formation/state_management/user_repository.dart';
import 'package:flutter_formation/state_management/users_bloc.dart';
import 'package:flutter_formation/state_management/users_event.dart';
import 'package:flutter_formation/state_management/users_state.dart';
import 'package:flutter_formation/webservices/api.dart';
import 'package:flutter_formation/webservices/api_response.dart';
import 'package:flutter_formation/webservices/loader.dart';
import 'package:flutter_formation/webservices/user.dart';
import 'package:flutter_formation/webservices/user_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebServicesAppBlocBuilder extends StatelessWidget {
  const WebServicesAppBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsersBloc(context.read<UsersRepository>())..add(LoadUsers()),
      child: Builder(builder: (context) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: Scaffold(
            body: BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                switch (state.status) {
                  case UserStatus.initial:
                    return const SafeArea(child: UserListView([]));
                  case UserStatus.loading:
                    return const SafeArea(child: Loader());
                  case UserStatus.error:
                    Future.microtask(
                      () => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Une erreur est survenue : ${state.error}",
                          ),
                        ),
                      ),
                    );
                    return const SafeArea(child: UserListView([]));
                  case UserStatus.done:
                    return SafeArea(child: UserListView(state.users!));
                }
              },
            ),
            appBar: AppBar(
              title: const Text("State management Bloc"),
            ),
            floatingActionButton: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed: () async {
                    context.read<UsersBloc>().add(FetchUsers(wrong: false));
                  },
                  child: const Icon(Icons.refresh),
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  onPressed: () async {
                    context.read<UsersBloc>().add(FetchUsers(wrong: true));
                  },
                  child: const Icon(Icons.clear),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

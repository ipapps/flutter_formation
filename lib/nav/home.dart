import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_formation/nav/detail.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).pushNamed(Detail.routeName);
              print(result);
            },
            child: Text("Go to detail"),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Screen404 extends StatelessWidget {
  const Screen404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Oops, cet endroit n'existe pas"),
      ),
    );
  }
}

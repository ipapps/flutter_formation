import 'package:flutter/material.dart';
import 'package:flutter_formation/nav/detail.dart';
import 'package:flutter_formation/nav/inherited_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(TestInheritedWidget.of(context).testString);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Detail(text: "coucou");
                  },
                ),
              );
              print(result);
            },
            child: Text("Go to detail"),
          ),
        ),
      ),
    );
  }
}

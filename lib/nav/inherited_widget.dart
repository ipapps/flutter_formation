import 'package:flutter/material.dart';

class TestInheritedWidget extends InheritedWidget {
  String testString;

  TestInheritedWidget({super.key, required this.testString, required super.child});

  @override
  bool updateShouldNotify(TestInheritedWidget oldWidget) {
    return oldWidget.testString != testString;
  }

  static TestInheritedWidget of(BuildContext context) {
    final TestInheritedWidget? result = context.dependOnInheritedWidgetOfExactType<TestInheritedWidget>();
    assert(result != null, 'No TestInheritedWidget found in context');
    return result!;
  }
}

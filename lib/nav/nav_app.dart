import 'package:flutter/material.dart';
import 'package:flutter_formation/nav/detail.dart';
import 'package:flutter_formation/nav/home.dart';
import 'package:flutter_formation/nav/inherited_widget.dart';
import 'package:flutter_formation/nav/router.dart';

class NavApp extends StatelessWidget {
  const NavApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // //FIRST IMPLEMENTATION
    return TestInheritedWidget(
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: const Home(),
      ),
    );

    //USING ROUTES
    // return TestInheritedWidget(
    //   child: MaterialApp(
    //     theme: ThemeData(primarySwatch: Colors.green),
    //     routes: {
    //       "/": (_) => const Home(),
    //       "detail": (_) => const Detail(text: "text"),
    //     },
    //   ),
    // );

    //USING ROUTER
    // return TestInheritedWidget(
    //   child: MaterialApp(
    //     theme: ThemeData(primarySwatch: Colors.green),
    //     onGenerateRoute: generateRoute,
    //     onGenerateInitialRoutes: (_) => [
    //       MaterialPageRoute(
    //         settings: const RouteSettings(name: "/"),
    //         builder: (_) => const Home(),
    //       ),
    //     ],
    //   ),
    // );
  }
}

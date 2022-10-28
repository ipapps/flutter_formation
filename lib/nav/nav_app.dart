import 'package:flutter/material.dart';
import 'package:flutter_formation/nav/detail.dart';
import 'package:flutter_formation/nav/home.dart';
import 'package:flutter_formation/nav/inherited_widget.dart';
import 'package:flutter_formation/nav/router.dart';
import 'package:flutter_formation/nav/screen404.dart';
import 'package:go_router/go_router.dart';

class NavApp extends StatelessWidget {
  const NavApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // //FIRST IMPLEMENTATION
    // return TestInheritedWidget(
    //   testString: "intérieur",
    //   child: MaterialApp(
    //     theme: ThemeData(primarySwatch: Colors.green),
    //     home: const Home(),
    //   ),
    // );

    //USING ROUTES
    // return TestInheritedWidget(
    //   testString: '',
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
    //   testString: '',
    //   child:
    //
    //
    //   MaterialApp(
    //     theme: ThemeData(primarySwatch: Colors.green),
    //     onGenerateRoute: (settings) {
    //       final routes = {
    //         "/": Home(),
    //         "detail": Detail(
    //           arguments: (settings.arguments as DetailArguments?) ?? DetailArguments("myArgument"),
    //         ),
    //       };
    //       return MaterialPageRoute(
    //         builder: (_) => routes[settings.name] ?? Screen404(),
    //         settings: settings,
    //       );
    //     },
    //     onGenerateInitialRoutes: (_) => [
    //       MaterialPageRoute(
    //         builder: (_) => const Home(),
    //         settings: RouteSettings(name: "/"),
    //       ),
    //     ],
    //   ),
    // );

    // USING GO ROUTE
    return TestInheritedWidget(
      testString: '',
      child: MaterialApp.router(
        routerConfig: GoRouter(routes: [
          GoRoute(
              path: "/",
              builder: (context, state) {
                return Home();
              })
        ]),
        theme: ThemeData(primarySwatch: Colors.green),
      ),
    );
  }
}

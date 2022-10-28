import 'package:flutter/material.dart';
import 'package:flutter_formation/nav/detail.dart';
import 'package:flutter_formation/nav/home.dart';
import 'package:flutter_formation/nav/screen404.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  final dynamicArguments = routeSettings.arguments;
  final Widget route;
  switch (routeSettings.name) {
    case "/":
      route = const Home();
      break;
    case "detail":
      String text = "text";
      if (dynamicArguments is DetailArguments) {
        text = dynamicArguments.myArgument;
        route = Detail(arguments: dynamicArguments);
      } else {
        route = Screen404();
      }
      break;
    default:
      route = const Screen404();
  }
  print(routeSettings);
  return MaterialPageRoute(settings: routeSettings, builder: (_) => route);
}

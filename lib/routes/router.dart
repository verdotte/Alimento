import 'package:flutter/material.dart';
import 'package:alimento/screens/home.dart';
import 'package:alimento/screens/defaultScreen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch(routeSettings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      default:
        return MaterialPageRoute(builder: (_) => DefaultScreen());
    }
  }
}
import 'package:flutter/material.dart';
import 'package:alimento/routes/router.dart';
import 'package:alimento/styles/theme.dart';
import 'package:alimento/screens/restaurantFood.dart';
import 'package:alimento/screens/home.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: alimentoTheme,
      routes: customRoutes
    );
  }
}



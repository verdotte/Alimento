import 'package:flutter/material.dart';
import 'package:alimento/routes/router.dart';
import 'package:alimento/styles/theme.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
      theme: alimentoTheme,
    );
  }
}



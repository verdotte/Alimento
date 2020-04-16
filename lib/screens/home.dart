import 'package:flutter/material.dart';
import 'package:alimento/styles/color.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: alBackgroundWhite,
        title: Text('Alimento', style: Theme.of(context).textTheme.headline),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DefaultScreen extends StatefulWidget {
  @override
  _DefaultScreenState createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Default Screen',
          style: TextStyle(fontFamily: 'Poppin', fontSize: 30.0),
        ),
      ),
    );
  }
}

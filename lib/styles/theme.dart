import 'package:flutter/material.dart';
import 'package:alimento/styles/color.dart';

final ThemeData alimentoTheme = _buildAlimentoTheme();

ThemeData _buildAlimentoTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: alBackgroundWhite,
    primaryColor: alMain,
    buttonTheme: base.buttonTheme.copyWith(
        buttonColor: alBackgroundWhite,
        textTheme: ButtonTextTheme.primary,
        padding: EdgeInsets.only(
            left: 125.0,
            right: 125.0,
            top: 12.0,
            bottom: 12.0
        ),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0)
        )
    ),
    scaffoldBackgroundColor: alBackgroundWhite,
    textSelectionColor: alSelection,
    errorColor: alError,

    textTheme: _buildAlimentoTextTheme(base.textTheme),
    primaryTextTheme: _buildAlimentoTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildAlimentoTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildAlimentoTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
        fontWeight: FontWeight.w900,
        fontFamily: 'Poppin',
        fontSize: 20.0
    ),
    title: base.title.copyWith(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: alBackgroundWhite,
        fontFamily: 'Raleway'
    ),
    caption: base.caption.copyWith(
      fontSize: 17.0,
      fontFamily: 'Poppin',
    ),

  );
}
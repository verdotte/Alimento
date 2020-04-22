import 'package:flutter/material.dart';
import 'package:alimento/styles/color.dart';

final ThemeData alimentoTheme = _buildAlimentoTheme();

ThemeData _buildAlimentoTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: alBackgroundWhite,
    primaryColor: alMain,
    buttonTheme: base.buttonTheme.copyWith(
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
        )
    ),
    scaffoldBackgroundColor: alBackgroundWhite,
    textSelectionColor: alDark,
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
        fontSize: 20.0,
        color: alDark,
    ),
    title: base.title.copyWith(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: alBackgroundWhite,
        fontFamily: 'Poppin'
    ),
    caption: base.caption.copyWith(
      fontSize: 17.0,
      fontFamily: 'Poppin',
      color: alDark,
    ),
    overline: base.caption.copyWith(
      fontSize: 15.0,
      fontFamily: 'Raleway',
      color: alMain,
    ),
    button: base.title.copyWith(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: alBackgroundWhite,
        fontFamily: 'Raleway'
    ),
  );
}
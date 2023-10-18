import 'color_scheme_dark.dart';
import 'package:flutter/material.dart';

class AppThemeDatas {
  final lightTheme = ThemeData.light();
  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorSchemeDark.instance!.bacground,
    primaryColor: Color(0xff2B44FF),
  );
}

import 'package:flutter/material.dart';

class ColorSchemeDark {
  static ColorSchemeDark? _instace;
  static ColorSchemeDark? get instance {
    _instace ??= ColorSchemeDark._init();
    return _instace;
  }

  ColorSchemeDark._init();

  final Color blue = Color(0xff2B44FF);
  final Color bacground = Color(0xff111016);
  final Color grey = Color(0xff666666);
}

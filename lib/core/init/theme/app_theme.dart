import 'package:flutter/material.dart';
import 'app_theme_datas.dart';

class AppTheme {
  static AppTheme? _instance;
  static AppTheme get instance {
    _instance ??= AppTheme._init();
    return _instance!;
  }

  AppTheme._init();

  ThemeData get theme => AppThemeDatas().darkTheme;
}

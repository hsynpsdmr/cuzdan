import 'package:flutter/material.dart';

import '../../constant/enum/app_theme_enum.dart';
import '../theme/app_theme.dart';
import '../theme/app_theme_datas.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppTheme.instance.theme;
  ThemeData get currentTheme => _currentTheme;

  void changeAppTheme(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = AppThemeDatas().lightTheme;
    } else {
      _currentTheme = AppThemeDatas().darkTheme;
    }
    notifyListeners();
  }
}

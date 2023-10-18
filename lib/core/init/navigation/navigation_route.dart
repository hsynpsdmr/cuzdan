import 'package:cuzdan/ui/login/view/login_view.dart';

import '../../../ui/onboard/view/onboard_view.dart';
import '../../../ui/onboard/view/welcome_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import '../../constant/navigation/navigation_constants.dart';
import '../../../ui/home/home_view.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance {
    _instance ??= NavigationRoute._init();
    return _instance!;
  }

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(HomeView());
      case NavigationConstants.WELCOME_VIEW:
        return normalNavigate(WelcomeView());
      case NavigationConstants.ONBOARD_VIEW:
        return normalNavigate(OnboardView());
      case NavigationConstants.LOGIN_VIEW:
        final arguments = args.arguments as Map;
        return normalNavigate(LoginView(authentication: arguments['authentication']));
      default:
        return normalNavigate(const Scaffold());
    }
  }

  PageRoute normalNavigate(Widget widget) {
    return Platform.isAndroid ? MaterialPageRoute(builder: (context) => widget) : CupertinoPageRoute(builder: (context) => widget);
  }

  PageRoute normalNavigateToPop(Widget widget) {
    return Platform.isAndroid ? MaterialPageRoute(builder: (context) => widget) : CupertinoPageRoute(builder: (context) => widget, fullscreenDialog: true);
  }
}

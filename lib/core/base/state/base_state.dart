import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);
  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;
  double get topPadding => MediaQuery.of(context).padding.top;
  double get bottomPadding => MediaQuery.of(context).padding.bottom;
  double get appBarSize => topPadding + dynamicHeight(60);
  double dynamicHeight(double value) => height / 844 * value;
  double dynamicWidth(double value) => width / 390 * value;
}

abstract class BaseStateless extends StatelessWidget {
  const BaseStateless({Key? key}) : super(key: key);
  ThemeData themeData(BuildContext context) => Theme.of(context);
  double height(BuildContext context) => MediaQuery.of(context).size.height;
  double width(BuildContext context) => MediaQuery.of(context).size.width;
  double topPadding(BuildContext context) => MediaQuery.of(context).padding.top;
  double bottomPadding(BuildContext context) => MediaQuery.of(context).padding.bottom;
  double appBarSize(BuildContext context) => topPadding(context) + dynamicHeight(context, 60);
  double dynamicHeight(BuildContext context, double value) => height(context) / 844 * value;
  double dynamicWidth(BuildContext context, double value) => width(context) / 390 * value;
}

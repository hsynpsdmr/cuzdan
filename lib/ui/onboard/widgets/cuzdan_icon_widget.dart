import 'package:flutter/material.dart';

import '../../../core/init/theme/color_scheme_dark.dart';

Widget cuzdanIconWidget() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        height: 70,
        decoration: BoxDecoration(
          color: ColorSchemeDark.instance!.blue,
          shape: BoxShape.circle,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 110),
        child: Text(
          'cüzdan',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

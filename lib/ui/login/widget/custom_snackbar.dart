import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String message;
  const CustomSnackBar(this.backgroundColor, this.icon, this.message, {key});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Icon(icon), Expanded(child: Text(message))],
      ),
      backgroundColor: backgroundColor,
      duration: Duration(seconds: 3),
      shape: StadiumBorder(),
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    );
  }
}

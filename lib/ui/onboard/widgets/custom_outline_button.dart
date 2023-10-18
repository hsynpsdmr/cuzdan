import 'package:cuzdan/core/base/state/base_state.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends BaseStateless {
  final String title;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? borderColor;
  const CustomOutlineButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.buttonColor = Colors.transparent,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dynamicHeight(context, 50),
      width: dynamicWidth(context, 125),
      child: ElevatedButton(
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Gilroy'),
          ),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: buttonColor,
            side: BorderSide(
              color: borderColor!,
              width: 1,
            ),
          ),
          onPressed: onPressed),
    );
  }
}

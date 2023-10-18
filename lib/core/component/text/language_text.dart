import 'package:flutter/material.dart';
import '../../extension/string_extension.dart';

class LanguageText extends StatelessWidget {
  final String title;
  final String? type;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  const LanguageText(
      {Key? key,
      required this.title,
      this.type,
      this.style,
      this.textAlign,
      this.overflow,
      this.maxLines})
      : super(key: key);

  String textDesigner() {
    return type == 'upper'
        ? title.localeUpper
        : type == 'lower'
            ? title.localeLower
            : title.locale;
  }

  @override
  Widget build(BuildContext context) {
    return Text(textDesigner(),
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines);
  }
}

class MultilineLanguageText extends StatelessWidget {
  final String title;
  final String? type;
  final TextStyle? style;
  final TextAlign? textAlign;
  const MultilineLanguageText(
      {Key? key, required this.title, this.type, this.style, this.textAlign})
      : super(key: key);

  String textDesigner() {
    return type == 'upper'
        ? title.localeUpper
        : type == 'lower'
            ? title.localeLower
            : title.locale;
  }

  @override
  Widget build(BuildContext context) {
    return Text(textDesigner().replaceAll(' ', '\n'),
        style: style, textAlign: textAlign);
  }
}

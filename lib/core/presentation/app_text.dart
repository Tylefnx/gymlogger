// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final TextStyle? textStyle;
  final Color? color;
  final String text;
  const AppText({
    super.key,
    required this.text,
    this.textStyle,
    this.color,
  });

  factory AppText.normal({required String text, Color? color}) {
    return AppText(
      text: text,
      textStyle: TextStyle(
        color: color,
      ),
    );
  }

  factory AppText.bold({required String text, Color? color}) {
    return AppText(
      text: text,
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  factory AppText.big_bold({required String text, Color? color}) {
    return AppText(
      text: text,
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: color,
      ),
    );
  }

  factory AppText.little_big_bold({required String text, Color? color}) {
    return AppText(
      text: text,
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: color,
      ),
    );
  }

  factory AppText.very_big_bold({required String text, Color? color}) {
    return AppText(
      text: text,
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 48,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}

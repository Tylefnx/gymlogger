import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final TextStyle? textStyle;
  final String text;
  const AppText({super.key, required this.text, this.textStyle});

  factory AppText.normal({required String text}) {
    return AppText(
      text: text,
      textStyle: TextStyle(),
    );
  }

  factory AppText.bold({required String text}) {
    return AppText(
      text: text,
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
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

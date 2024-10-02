import 'package:flutter/material.dart';

class AppPadding extends StatelessWidget {
  final EdgeInsets? padding;
  const AppPadding({super.key, this.padding});

  factory AppPadding.h10v20() {
    return AppPadding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
    );
  }
}

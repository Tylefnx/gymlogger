import 'package:flutter/material.dart';

class AppPadding extends StatelessWidget {
  final EdgeInsets padding;
  final Widget? child;
  const AppPadding({super.key, required this.padding, this.child});

  factory AppPadding.h10v20({required Widget child}) {
    return AppPadding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: child,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: child,
    );
  }
}

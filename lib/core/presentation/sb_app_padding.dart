import 'package:flutter/material.dart';

class SB_AppPadding extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  const SB_AppPadding({super.key, this.height, this.width, this.child});

  factory SB_AppPadding.h10({required Widget? child}) {
    return SB_AppPadding(
      height: 10,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 0,
      width: width ?? 0,
      child: child,
    );
  }
}

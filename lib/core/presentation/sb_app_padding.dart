import 'package:flutter/material.dart';

class SB_AppPadding extends StatelessWidget {
  final double? height;
  final double? width;
  const SB_AppPadding({super.key, this.height, this.width});

  factory SB_AppPadding.h10({Widget? child}) {
    return SB_AppPadding(
      height: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 0,
      width: width ?? 0,
    );
  }
}

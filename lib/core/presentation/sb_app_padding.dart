import 'package:flutter/material.dart';

class SB_AppPadding extends StatelessWidget {
  final double? height;
  final double? width;
  const SB_AppPadding({super.key, this.height, this.width});

  factory SB_AppPadding.h10() {
    return const SB_AppPadding(
      height: 10,
    );
  }
  factory SB_AppPadding.w15() {
    return const SB_AppPadding(
      width: 15,
    );
  }

  factory SB_AppPadding.w30() {
    return const SB_AppPadding(
      width: 30,
    );
  }

  factory SB_AppPadding.h30() {
    return const SB_AppPadding(
      height: 30,
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

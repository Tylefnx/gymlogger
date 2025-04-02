import 'package:flutter/material.dart';

class SBAppPadding extends StatelessWidget {
  final double? height;
  final double? width;
  const SBAppPadding({super.key, this.height, this.width});

  factory SBAppPadding.h10() {
    return const SBAppPadding(
      height: 10,
    );
  }
  factory SBAppPadding.w15() {
    return const SBAppPadding(
      width: 15,
    );
  }

  factory SBAppPadding.w30() {
    return const SBAppPadding(
      width: 30,
    );
  }

  factory SBAppPadding.h30() {
    return const SBAppPadding(
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

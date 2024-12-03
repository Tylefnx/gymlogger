import 'package:flutter/material.dart';

class AppPadding extends StatelessWidget {
  final EdgeInsets padding;
  final Widget? child;
  const AppPadding({super.key, required this.padding, this.child});

  factory AppPadding.h10v20({required Widget child}) {
    return AppPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: child,
    );
  }

  factory AppPadding.h30v40({required Widget child}) {
    return AppPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 40,
      ),
      child: child,
    );
  }

  factory AppPadding.v15({required Widget child}) {
    return AppPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: child,
    );
  }

  factory AppPadding.v25({required Widget child}) {
    return AppPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
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

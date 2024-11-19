import 'package:flutter/material.dart';
import 'package:gymlogger/core/presentation/app_gridview.dart';

class LogScreen extends StatelessWidget {
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppGridviewWidget(children: []),
      ],
    );
  }
}

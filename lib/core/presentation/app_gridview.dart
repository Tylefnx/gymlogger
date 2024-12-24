import 'package:flutter/material.dart';
import 'package:gymlogger/core/presentation/app_text.dart';

class AppGridviewWidget extends StatelessWidget {
  final List<Widget> children;
  const AppGridviewWidget({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 10,
      ),
      crossAxisCount: 2,
      children: children,
    );
  }
}

class GridviewSectionCard extends StatelessWidget {
  final void Function() onTap;
  final String label;
  final String iconPath;
  const GridviewSectionCard({
    super.key,
    required this.label,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                iconPath,
                fit: BoxFit.cover,
              ),
            ),
            AppText.big_bold(text: label),
          ],
        ),
      ),
    );
  }
}

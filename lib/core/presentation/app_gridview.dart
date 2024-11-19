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
      padding: EdgeInsets.symmetric(
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
  final IconData icon;
  const GridviewSectionCard({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.blueGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(),
            Icon(
              icon,
              size: 90,
            ),
            AppText.big_bold(text: label),
          ],
        ),
      ),
    );
  }
}

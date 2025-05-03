import 'package:flutter/material.dart';
import 'package:gymlogger/core/presentation/app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final ColorScheme colorScheme;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppText.bold(
        text: title,
        color: colorScheme.onPrimary,
      ),
      centerTitle: true,
      leading: leading,
      actions: actions,
      backgroundColor: colorScheme.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      elevation: 4.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

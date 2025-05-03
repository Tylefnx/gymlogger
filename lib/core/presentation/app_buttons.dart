import 'package:flutter/material.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';

class AppAddButton extends StatelessWidget {
  final String text;
  const AppAddButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        children: [
          Icon(Icons.add, color: colorScheme.onPrimary),
          AppPadding.h10v20(
            child: AppText(
              text: text,
            ),
          ),
        ],
      ),
    );
  }
}

class AppTallButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icondata;
  final String text;
  const AppTallButton({
    super.key,
    required this.text,
    this.icondata,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ElevatedButton(
      onPressed: onPressed,
      child: AppPadding.v15(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icondata != null)
              Icon(
                icondata,
                color: colorScheme.onPrimary,
              ),
            AppText.big_bold(text: text),
          ],
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      onPressed: onPressed,
      child: AppText.big_bold(
        text: title,
      ),
    );
  }
}

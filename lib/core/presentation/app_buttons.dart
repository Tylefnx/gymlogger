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
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        children: [
          Icon(Icons.add),
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
  final IconData? icondata;
  final String text;
  const AppTallButton({super.key, required this.text, this.icondata});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: AppPadding.v25(
        child: Row(
          children: [
            if (icondata != null) Icon(icondata),
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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: AppText.big_bold(
        text: title,
      ),
    );
  }
}

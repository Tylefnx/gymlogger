import 'package:flutter/material.dart';
import 'package:gymlogger/core/presentation/app_text.dart';

class AppDropDownButton<T> extends StatelessWidget {
  const AppDropDownButton({
    super.key,
    required this.items,
    this.onChanged,
    required this.value,
    this.hint,
  });

  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final T value;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: AppText(text: hint ?? ''),
      value: value,
      items: items,
      onChanged: onChanged,
    );
  }
}

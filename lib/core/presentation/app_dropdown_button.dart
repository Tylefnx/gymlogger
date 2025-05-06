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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton(
        isExpanded: true,
        isDense: true,
        borderRadius: BorderRadius.circular(15),
        underline: const SizedBox(),
        hint: AppText(text: hint ?? ''),
        value: value,
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}

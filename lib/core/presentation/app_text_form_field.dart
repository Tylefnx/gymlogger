import 'package:flutter/material.dart';
import 'package:gymlogger/core/presentation/app_text.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.textInputType,
    required this.label,
    this.suffixText,
    this.onChanged,
    required this.controller,
  });

  final TextEditingController controller;
  final TextInputType textInputType;
  final String? suffixText;
  final String label;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      keyboardType: textInputType,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        suffixText: suffixText,
        label: AppText.bold(text: label),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

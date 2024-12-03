// ignore_for_file: avoid_unused_constructor_parameters

import 'package:flutter/material.dart';
import 'package:gymlogger/core/presentation/app_text.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.textInputType,
    required this.label,
    this.suffixText,
    this.onChanged,
    this.obscureText,
    required this.controller,
  });

  final TextEditingController controller;
  final TextInputType textInputType;
  final String? suffixText;
  final String label;
  final bool? obscureText;
  final void Function(String)? onChanged;

  factory AppTextFormField.numberWithOptions({
    required String label,
    required TextEditingController controller,
    String? suffixText,
    void Function(String)? onChanged,
  }) {
    return AppTextFormField(
      textInputType: TextInputType.number,
      label: label,
      controller: controller,
      suffixText: suffixText,
    );
  }
  factory AppTextFormField.name({
    required String label,
    required TextEditingController controller,
    String? suffixText,
    void Function(String)? onChanged,
  }) {
    return AppTextFormField(
      textInputType: TextInputType.name,
      label: label,
      controller: controller,
      suffixText: suffixText,
    );
  }

  factory AppTextFormField.password({
    required String label,
    required TextEditingController controller,
    String? suffixText,
    void Function(String)? onChanged,
  }) {
    return AppTextFormField(
      textInputType: TextInputType.name,
      label: label,
      obscureText: true,
      controller: controller,
      suffixText: suffixText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      keyboardType: textInputType,
      textAlign: TextAlign.center,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        suffixText: suffixText,
        label: AppText.bold(text: label),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

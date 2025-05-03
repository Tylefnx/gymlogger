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
    this.icon,
    this.obscureText,
    required this.controller,
  });

  final TextEditingController controller;
  final TextInputType textInputType;
  final String? suffixText;
  final String label;
  final IconData? icon;
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
    IconData? icon,
    void Function(String)? onChanged,
  }) {
    return AppTextFormField(
      textInputType: TextInputType.name,
      label: label,
      controller: controller,
      suffixText: suffixText,
      icon: icon,
    );
  }

  factory AppTextFormField.password({
    required String label,
    required TextEditingController controller,
    IconData? icon,
    String? suffixText,
    void Function(String)? onChanged,
  }) {
    return AppTextFormField(
      textInputType: TextInputType.name,
      label: label,
      obscureText: true,
      controller: controller,
      suffixText: suffixText,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixText: suffixText,
        label: AppText.bold(
          text: label,
        ),
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

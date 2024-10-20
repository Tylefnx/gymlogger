import 'package:flutter/material.dart';

class AppDropDownButton extends StatelessWidget {
  const AppDropDownButton({
    super.key,
    required this.items,
    this.onChanged,
  });

  final List<DropdownMenuItem<dynamic>> items;
  final void Function(dynamic)? onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      selectedItemBuilder: (context) => [Text(context.widget.toString())],
      items: items,
      onChanged: onChanged,
    );
  }
}

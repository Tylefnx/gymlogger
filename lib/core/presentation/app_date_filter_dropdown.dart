import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class DateFilterDropdown extends HookWidget {
  final Function(DateTime) onDateSelected;

  const DateFilterDropdown({super.key, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    final selectedDate = useState(DateTime.now());

    return DropdownButton<DateTime>(
      value: selectedDate.value,
      onChanged: (DateTime? newValue) {
        if (newValue != null) {
          selectedDate.value = newValue;
          onDateSelected(newValue);
        }
      },
      items: List.generate(
        12,
        (index) {
          final date = DateTime(DateTime.now().year, index + 1, 1);
          return DropdownMenuItem(
            value: date,
            child: Text(DateFormat('MMMM yyyy').format(date)),
          );
        },
      ),
    );
  }
}

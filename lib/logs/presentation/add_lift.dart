import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/calculator/presentation/1rm_calculator.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_numberpicker.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/app_text_form_field.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class AddLiftScreen extends HookWidget {
  final PageController pageController;
  final ValueNotifier<int> navigatorIndex;
  final ValueNotifier<List<MapEntry<String, double>>> lifts;
  const AddLiftScreen({
    super.key,
    required this.lifts,
    required this.pageController,
    required this.navigatorIndex,
  });

  @override
  Widget build(BuildContext context) {
    final weightController = useTextEditingController();
    final selectedRep = useState<int>(1);
    final selectedLiftDate = useState<DateTime>(DateTime.now());
    final _now = DateTime.now();
    return AppPadding.h30v40(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: AppText.very_big_bold(
              text: 'Date selection',
            ),
          ),
          _AddLiftDatePicker(now: _now, selectedLiftDate: selectedLiftDate),
          AppPadding.h10v20(
            child: _OneRepMaxCalculator(
              weightController: weightController,
            ),
          ),
          AppNumberPicker(selectedReps: selectedRep),
          AppPadding.h10v20(
            child: _AddLiftButton(
              weightController: weightController,
              selectedRep: selectedRep,
              selectedLiftDate: selectedLiftDate,
              lifts: lifts,
              pageController: pageController,
              navigatorIndex: navigatorIndex,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddLiftButton extends StatelessWidget {
  final PageController pageController;
  final ValueNotifier<int> navigatorIndex;
  const _AddLiftButton({
    super.key,
    required this.weightController,
    required this.selectedRep,
    required this.selectedLiftDate,
    required this.lifts,
    required this.pageController,
    required this.navigatorIndex,
  });

  final TextEditingController weightController;
  final ValueNotifier<int> selectedRep;
  final ValueNotifier<DateTime> selectedLiftDate;
  final ValueNotifier<List<MapEntry<String, double>>> lifts;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () {
        if (weightController.text != '') {
          FocusScope.of(context).unfocus();
          final weight = double.parse(weightController.text);
          final oneRepMax = calculateOneRepMax(weight, selectedRep.value);
          final date = selectedLiftDate.value.toString().substring(0, 10);
          lifts.value = List.from(lifts.value)
            ..add(MapEntry<String, double>(date, oneRepMax));
        }
        navigatorIndex.value = 1;
        pageController.jumpToPage(1);
      },
      title: 'Add Lift',
    );
  }
}

class _AddLiftDatePicker extends StatelessWidget {
  const _AddLiftDatePicker({
    super.key,
    required DateTime now,
    required this.selectedLiftDate,
  }) : _now = now;

  final DateTime _now;
  final ValueNotifier<DateTime> selectedLiftDate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollDatePicker(
        minimumDate: DateTime(
          _now.year - 3,
          _now.month,
          _now.day,
        ),
        selectedDate: selectedLiftDate.value,
        onDateTimeChanged: (_) {
          selectedLiftDate.value = _;
        },
      ),
    );
  }
}

class _OneRepMaxCalculator extends StatelessWidget {
  final TextEditingController weightController;
  const _OneRepMaxCalculator({super.key, required this.weightController});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppTextFormField.numberWithOptions(
            controller: weightController,
            label: 'Weight',
            suffixText: 'KG',
          ),
        ),
      ],
    );
  }
}

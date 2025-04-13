import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/authentication/shared/providers.dart';
import 'package:gymlogger/calculator/presentation/1rm_calculator.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_numberpicker.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/app_text_form_field.dart';
import 'package:gymlogger/logs/domain/movement_log_for_specific_lift.dart';
import 'package:gymlogger/logs/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

@RoutePage()
class AddLiftScreen extends HookWidget {
  final String lift;
  final PageController pageController;
  final ValueNotifier<int> navigatorIndex;
  final MovementLogsForSpecificLift movementLogsForSpecificLift;
  const AddLiftScreen({
    super.key,
    required this.movementLogsForSpecificLift,
    required this.lift,
    required this.pageController,
    required this.navigatorIndex,
  });

  @override
  Widget build(BuildContext context) {
    final weightController = useTextEditingController();
    final selectedRep = useState<int>(1);
    final selectedLiftDate = useState<DateTime>(DateTime.now());
    final now = DateTime.now();
    return AppPadding.h30v40(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: AppText.very_big_bold(
              text: 'Date selection',
            ),
          ),
          _AddLiftDatePicker(now: now, selectedLiftDate: selectedLiftDate),
          AppPadding.h10v20(
            child: _OneRepMaxCalculator(
              weightController: weightController,
            ),
          ),
          AppNumberPicker(selectedReps: selectedRep),
          AppPadding.h10v20(
            child: _AddLiftButton(
              lift: lift,
              weightController: weightController,
              selectedRep: selectedRep,
              selectedLiftDate: selectedLiftDate,
              movementLogsForSpecificLift: movementLogsForSpecificLift,
              pageController: pageController,
              navigatorIndex: navigatorIndex,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddLiftButton extends ConsumerWidget {
  final PageController pageController;
  final String lift;
  final ValueNotifier<int> navigatorIndex;
  const _AddLiftButton({
    required this.lift,
    required this.weightController,
    required this.selectedRep,
    required this.selectedLiftDate,
    required this.movementLogsForSpecificLift,
    required this.pageController,
    required this.navigatorIndex,
  });

  final TextEditingController weightController;
  final ValueNotifier<int> selectedRep;
  final ValueNotifier<DateTime> selectedLiftDate;
  final MovementLogsForSpecificLift movementLogsForSpecificLift;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.read(authStateNotifierProvider);

    return AppButton(
      onPressed: () {
        final username = ref.read(authStateNotifierProvider).maybeMap(
              orElse: () => '',
              authenticated: (_) => _.user.username,
            );
        if (weightController.text != '' && username != '') {
          FocusScope.of(context).unfocus();
          final weight = double.parse(weightController.text);
          final oneRepMax = double.parse(
            calculateOneRepMax(weight, selectedRep.value).toStringAsFixed(2),
          );
          final date = selectedLiftDate.value.toString().substring(0, 10);
          ref.read(movementsStateNotifierProvider.notifier).saveUserLifts(
                username: username,
                exercize: lift,
                date: date,
                weight: oneRepMax,
                token: authState.maybeMap(
                  orElse: () => '',
                  authenticated: (_) => _.user.token,
                ),
              );
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
  const _OneRepMaxCalculator({required this.weightController});

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

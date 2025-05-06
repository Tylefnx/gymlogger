import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/calculator/shared/dropdowns.dart';
import 'package:gymlogger/core/constant_lists.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';

@RoutePage()
class StrengthLevelCalculator extends HookWidget {
  const StrengthLevelCalculator({super.key});
  @override
  Widget build(BuildContext context) {
    final weightController = useTextEditingController();
    final bwController = useTextEditingController();
    final excersize = useState<String?>(null);
    final gender = useState<String?>(null);
    final strLevel = useState<String>('');
    final row = useState<List<Widget>>([]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strength Level Calculator'),
      ),
      body: AppPadding.h30v40(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WeightSelectionSection(
                weightController: weightController,
              ),
              BWSelectionSection(bwController: bwController),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GenderSelectionWidget(gender: gender),
                  ),
                  Expanded(
                    child: ExcersizeSelectionSection(
                      excersize: excersize,
                      strengthLevelExcersize: strengthLevelExcersize,
                    ),
                  ),
                ],
              ),
              Row(
                children: row.value,
              ),
              AppButton(
                onPressed: () {
                  strLevel.value = strengthLevel(
                    weightController.text,
                    excersize.value,
                    bwController.text,
                    gender.value ?? 'male', //TODO: create error if null
                  );
                  row.value = addStars(strLevel.value);
                },
                title: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String strengthLevel(
  String weight,
  String? excersize,
  String bw,
  String gender,
) {
  final liftWeight = double.tryParse(weight);
  final lifterBW = double.tryParse(bw);
  if (lifterBW != null && liftWeight != null) {
    final bwRatio = liftWeight / lifterBW;
    switch (excersize) {
      case 'Deadlift':
        return calculateDeadliftStrength(bwRatio, gender);
      case 'Squat':
        return calculateSquatStrength(bwRatio, gender);
      case 'Bench Press':
        return calculateBenchPressStrength(bwRatio, gender);
      case 'Overhead Press':
        return calculateOHPstrength(bwRatio, gender);
    }
  }
  return '';
}

String calculateDeadliftStrength(double bwRatio, String gender) {
  if (gender == 'male') {
    if (bwRatio > 3.5) {
      return 'Freak';
    } else if (bwRatio > 3.00) {
      return 'Elite';
    } else if (bwRatio > 2.25) {
      return 'Advanced';
    } else if (bwRatio > 1.5) {
      return 'Intermediate';
    } else {
      return 'Novice';
    }
  } else {
    if (bwRatio > 3) {
      return 'Freak';
    } else if (bwRatio > 2.25) {
      return 'Elite';
    } else if (bwRatio > 1.75) {
      return 'Advanced';
    } else if (bwRatio > 1.25) {
      return 'Intermediate';
    } else {
      return 'Novice';
    }
  }
}

String calculateBenchPressStrength(double bwRatio, String gender) {
  if (gender == 'male') {
    if (bwRatio > 2.25) {
      return 'Freak';
    } else if (bwRatio > 2.00) {
      return 'Elite';
    } else if (bwRatio > 1.5) {
      return 'Advanced';
    } else if (bwRatio > 1.00) {
      return 'Intermediate';
    } else {
      return 'Novice';
    }
  } else {
    if (bwRatio > 1.25) {
      return 'Freak';
    } else if (bwRatio > 1) {
      return 'Elite';
    } else if (bwRatio > 0.75) {
      return 'Advanced';
    } else if (bwRatio > 0.5) {
      return 'Intermediate';
    } else {
      return 'Novice';
    }
  }
}

String calculateSquatStrength(double bwRatio, String gender) {
  if (gender == 'male') {
    if (bwRatio > 3.00) {
      return 'Freak';
    } else if (bwRatio > 2.50) {
      return 'Elite';
    } else if (bwRatio > 1.75) {
      return 'Advanced';
    } else if (bwRatio > 1.25) {
      return 'Intermediate';
    } else {
      return 'Novice';
    }
  } else {
    if (bwRatio > 2.25) {
      return 'Freak';
    } else if (bwRatio > 1.75) {
      return 'Elite';
    } else if (bwRatio > 1.5) {
      return 'Advanced';
    } else if (bwRatio > 1) {
      return 'Intermediate';
    } else {
      return 'Novice';
    }
  }
}

String calculateOHPstrength(double bwRatio, String gender) {
  if (gender == 'male') {
    if (bwRatio > 1.35) {
      return 'Freak';
    } else if (bwRatio > 1.05) {
      return 'Elite';
    } else if (bwRatio > 0.8) {
      return 'Advanced';
    } else if (bwRatio > 0.55) {
      return 'Intermediate';
    } else {
      return 'Novice';
    }
  } else {
    if (bwRatio > 1) {
      return 'Freak';
    } else if (bwRatio > 0.75) {
      return 'Elite';
    } else if (bwRatio > 0.55) {
      return 'Advanced';
    } else if (bwRatio > 0.35) {
      return 'Intermediate';
    } else {
      return 'Novice';
    }
  }
}

List<Widget> addStars(String strlevel) {
  switch (strlevel) {
    case 'Freak':
      return [
        FittedBox(child: AppText.little_big_bold(text: strlevel)),
        const Spacer(),
        const Icon(Icons.star),
        const Icon(Icons.star),
        const Icon(Icons.star),
        const Icon(Icons.star),
        const Icon(Icons.star),
      ];
    case 'Elite':
      return [
        FittedBox(child: AppText.little_big_bold(text: strlevel)),
        const Spacer(),
        const Icon(Icons.star),
        const Icon(Icons.star),
        const Icon(Icons.star),
        const Icon(Icons.star),
        const Icon(Icons.star_border),
      ];
    case 'Advanced':
      return [
        FittedBox(child: AppText.little_big_bold(text: strlevel)),
        const Spacer(),
        const Icon(Icons.star),
        const Icon(Icons.star),
        const Icon(Icons.star),
        const Icon(Icons.star_border),
        const Icon(Icons.star_border),
      ];
    case 'Intermediate':
      return [
        FittedBox(child: AppText.little_big_bold(text: strlevel)),
        const Spacer(),
        const Icon(Icons.star),
        const Icon(Icons.star),
        const Icon(Icons.star_border),
        const Icon(Icons.star_border),
        const Icon(Icons.star_border),
      ];
    case 'Novice':
      return [
        FittedBox(child: AppText.little_big_bold(text: strlevel)),
        const Spacer(),
        const Icon(Icons.star),
        const Icon(Icons.star_border),
        const Icon(Icons.star_border),
        const Icon(Icons.star_border),
        const Icon(Icons.star_border),
      ];
    default:
      return [];
  }
}

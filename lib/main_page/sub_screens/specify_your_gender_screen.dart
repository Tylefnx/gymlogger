import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/authentication/shared/providers.dart';
import 'package:gymlogger/calculator/shared/dropdowns.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/router/app_router.dart';
import 'package:gymlogger/core/shared/app_toasts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpecifyYourGenderScreen extends HookConsumerWidget {
  const SpecifyYourGenderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const pref = 'Prefer not to say';
    final authState = ref.watch(authStateNotifierProvider);
    final gender = useState<String?>(null);
    final userNotifier = ref.read(authStateNotifierProvider.notifier);
    return authState.maybeMap(
      orElse: () {
        return const SizedBox();
      },
      authenticated: (_) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: AppPadding.h30v40(
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: AppText.big_bold(text: 'Please specify your gender'),
                ),
                SpecifyGenderWidget(gender: gender),
                AppButton(
                  onPressed: () {
                    if (gender.value == null) {
                      failureToast(
                        context: context,
                        error: 'Please select an option',
                      );
                    } else {
                      userNotifier.updateUser(
                        token: _.user.token,
                        username: _.user.username,
                        sex: gender.value != pref ? gender.value! : 'Unknown',
                      );
                      AutoRouter.of(context).push(const MainRoute());
                    }
                  },
                  title: 'Submit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

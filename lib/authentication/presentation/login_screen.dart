import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/authentication/shared/providers.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/app_text_form_field.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';
import 'package:gymlogger/core/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

@RoutePage()
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = useTextEditingController(text: '');
    final password = useTextEditingController(text: '');
    return Scaffold(
      body: AppPadding.h30v40(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText.very_big_bold(text: 'Welcome to Gymlogger'),
            SB_AppPadding.h30(),
            AppTextFormField.name(
              label: 'Username',
              controller: username,
            ),
            AppPadding.v15(
              child: AppTextFormField.password(
                label: 'password',
                controller: password,
              ),
            ),
            AppButton(
              onPressed: () {
                login(
                  ref: ref,
                  username: username.text,
                  password: password.text,
                );

                AutoRouter.of(context).pushAndPopUntil(
                  const MainRoute(),
                  predicate: (_) {
                    return false;
                  },
                );
              },
              title: 'Login',
            ),
            Row(
              children: [
                AppText.bold(text: "Don't have an account? Then"),
                TextButton(
                  onPressed: () => AutoRouter.of(context).popAndPush(
                    const RegisterRoute(),
                  ),
                  child: AppText.big_bold(text: 'Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void login({
  required WidgetRef ref,
  required String? username,
  required String? password,
}) async {
  if (username != null && password != null) {
    ref.read(authStateNotifierProvider.notifier).login(
          username: username,
          password: password,
        );
    final state = ref.read(authStateNotifierProvider);

    toastification.show(
      title: state.maybeMap(
        orElse: () => AppText.bold(text: 'An unknown error occured'),
        unauthenticated: (_) => AppText.bold(text: 'Failed to Log in'),
        authenticated: (_) => AppText.bold(text: 'Successfuly logged in'),
      ),
    );
    print(ref.read(authStateNotifierProvider));
  }
}

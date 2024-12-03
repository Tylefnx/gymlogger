import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:gymlogger/authentication/shared/providers.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/app_text_form_field.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = useTextEditingController(text: '');
    final password = useTextEditingController(text: '');
    final passwordAgain = useTextEditingController(text: '');
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
                label: 'Password',
                controller: password,
              ),
            ),
            AppTextFormField.password(
              label: 'Password Again',
              controller: passwordAgain,
            ),
            SB_AppPadding.h10(),
            AppButton(
              onPressed: () async => register(
                ref: ref,
                username: username.text,
                password: password.text,
                passwordAgain: passwordAgain.text,
              ),
              title: 'Register',
            ),
            Row(
              children: [
                AppText.bold(text: "You have an account? Then"),
                TextButton(
                  onPressed: () => context.push('/authentication/login'),
                  child: AppText.big_bold(text: 'login'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> register({
  required WidgetRef ref,
  required String username,
  required String password,
  required String passwordAgain,
}) async {
  if (username != '' && password != '') {
    if (password == passwordAgain) {
      await ref.read(authStateNotifierProvider.notifier).register(
            username: username,
            password: password,
          );
      print(ref.read(authStateNotifierProvider));
    }
  }
}

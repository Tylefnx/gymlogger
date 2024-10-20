import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/app_text_form_field.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: AppTextFormField.name(
                label: 'password',
                controller: password,
              ),
            ),
            AppButton(
              onPressed: () => GoRouter.of(context).goNamed('home_page'),
              title: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}

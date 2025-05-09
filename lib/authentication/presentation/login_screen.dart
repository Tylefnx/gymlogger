import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/authentication/shared/providers.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/app_text_form_field.dart';
import 'package:gymlogger/core/presentation/extra_long_widget_for_decorated_box_usage_widget.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';
import 'package:gymlogger/core/router/app_router.dart';
import 'package:gymlogger/core/shared/app_toasts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = useTextEditingController(text: '');
    final password = useTextEditingController(text: '');
    final colorScheme = Theme.of(context).colorScheme;
    return ExtraLongWidgetForDecoratedBoxUsageWidget(
      child: LogicScreenComponents(
        colorScheme: colorScheme,
        username: username,
        password: password,
      ),
    );
  }
}

class LogicScreenComponents extends ConsumerWidget {
  const LogicScreenComponents({
    super.key,
    required this.colorScheme,
    required this.username,
    required this.password,
  });

  final ColorScheme colorScheme;
  final TextEditingController username;
  final TextEditingController password;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        Center(
          child: AppText.little_big_bold(
            text: 'Welcome to Gymlogger',
            color: colorScheme.onSurface,
          ),
        ),
        SBAppPadding.h30(),
        AppTextFormField.name(
          icon: Icons.person,
          label: 'Username',
          controller: username,
        ),
        AppPadding.v15(
          child: AppTextFormField.password(
            icon: Icons.lock,
            label: 'Password',
            controller: password,
          ),
        ),
        AppButton(
          onPressed: () => _login(
            username: username.text,
            password: password.text,
            context: context,
            ref: ref,
          ),
          title: 'Login',
        ),
        Row(
          children: [
            AppText.bold(
              text: "Don't have an account? Then",
              color: colorScheme.onSurface,
            ),
            TextButton(
              onPressed: () => AutoRouter.of(context).popAndPush(
                const RegisterRoute(),
              ),
              child: AppText.big_bold(text: 'Register'),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}

Future<void> _login({
  required WidgetRef ref,
  required BuildContext context,
  required String username,
  required String password,
}) async {
  if (usernameAndPasswordNotNull(
        username: username,
        password: password,
      ) ==
      null) {
    await ref.read(authStateNotifierProvider.notifier).login(
          username: username,
          password: password,
        );
  } else {
    failureToast(
      error: usernameAndPasswordNotNull(
            username: username,
            password: password,
          ) ??
          '',
      context: context,
    );
  }
}

String? usernameAndPasswordNotNull({
  required String username,
  required String password,
}) {
  if (username == '' && password == '') {
    return 'Enter your username and password';
  } else if (username == '') {
    return 'Please enter your username';
  } else if (password == '') {
    return 'Please enter your password';
  } else {
    return null;
  }
}

void showLoginToast() {}

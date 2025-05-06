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
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = useTextEditingController(text: '');
    final password = useTextEditingController(text: '');
    final passwordAgain = useTextEditingController(text: '');
    return ExtraLongWidgetForDecoratedBoxUsageWidget(
      child: RegisterScreenComponents(
        username: username,
        password: password,
        passwordAgain: passwordAgain,
      ),
    );
  }
}

class RegisterScreenComponents extends ConsumerWidget {
  const RegisterScreenComponents({
    super.key,
    required this.username,
    required this.password,
    required this.passwordAgain,
  });

  final TextEditingController username;
  final TextEditingController password;
  final TextEditingController passwordAgain;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText.little_big_bold(text: 'Welcome to Gymlogger'),
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
        AppTextFormField.password(
          icon: Icons.lock_reset,
          label: 'Password Again',
          controller: passwordAgain,
        ),
        SBAppPadding.h10(),
        AppButton(
          onPressed: () async => register(
            ref: ref,
            username: username.text,
            password: password.text,
            passwordAgain: passwordAgain.text,
            context: context,
          ),
          title: 'Register',
        ),
        Row(
          children: [
            AppText.bold(text: "You have an account? Then"),
            TextButton(
              onPressed: () => AutoRouter.of(context).pushAndPopUntil(
                const MainRoute(),
                predicate: (Route<dynamic> route) {
                  return false;
                },
              ),
              child: AppText.big_bold(text: 'login'),
            ),
          ],
        ),
      ],
    );
  }
}

Future<void> register({
  required WidgetRef ref,
  required String username,
  required String password,
  required String passwordAgain,
  required BuildContext context,
}) async {
  if (username != '' && password != '') {
    if (password == passwordAgain) {
      await ref.read(authStateNotifierProvider.notifier).register(
            username: username,
            password: password,
          );
      // ignore: use_build_context_synchronously
      AutoRouter.of(context).pushAndPopUntil(
        const MainRoute(),
        predicate: (Route<dynamic> route) {
          return true;
        },
      );
    }
  }
}

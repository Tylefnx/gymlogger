import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/authentication/domain/user.dart';
import 'package:gymlogger/authentication/shared/providers.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/app_text_form_field.dart';
import 'package:gymlogger/core/presentation/loading_screen.dart';
import 'package:gymlogger/core/shared/app_toasts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class UpdateUserScreen extends HookConsumerWidget {
  const UpdateUserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final emailAgainController = useTextEditingController();
    final surnameController = useTextEditingController();
    final authState = ref.watch(authStateNotifierProvider);
    initializeProfileInfos(
      nameController: nameController,
      surnameController: surnameController,
      emailController: emailController,
      emailAgainController: emailAgainController,
      ref: ref,
    );

    return authState.map(
      unauthenticated: (_) => const Scaffold(),
      authenticated: (_) => _UpdateProfilePage(
        nameController: nameController,
        surnameController: surnameController,
        emailController: emailController,
        emailAgainController: emailAgainController,
        passwordController: passwordController,
      ),
      loading: (_) => const LoadingScreen(),
    );
  }
}

class _UpdateProfilePage extends ConsumerWidget {
  const _UpdateProfilePage({
    required this.nameController,
    required this.surnameController,
    required this.emailController,
    required this.emailAgainController,
    required this.passwordController,
  });

  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController emailController;
  final TextEditingController emailAgainController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText.bold(text: 'Update User'),
      ),
      body: AppPadding.h30v40(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 15,
            children: [
              AppTextFormField.name(
                label: 'Name',
                controller: nameController,
              ),
              AppTextFormField.name(
                label: 'Surname',
                controller: surnameController,
              ),
              AppTextFormField.name(
                label: 'Email',
                controller: emailController,
              ),
              AppTextFormField.name(
                label: 'Email Again',
                controller: emailAgainController,
              ),
              AppTextFormField.password(
                label: 'Password',
                controller: passwordController,
              ),
              AppButton(
                onPressed: () async {
                  await _submit(
                    ref: ref,
                    emailController: emailController,
                    emailAgainController: emailAgainController,
                    nameController: nameController,
                    surnameController: surnameController,
                    passwordController: passwordController,
                    context: context,
                  );
                  final state = ref.watch(authStateNotifierProvider);
                  state.maybeMap(
                    orElse: () {},
                    authenticated: (_) {
                      if (_.failure == null) {
                        successToast(
                          success: 'User successfuly updated',
                          context: context,
                        );
                      } else if (_.failure?.error == "Wrong Password") {
                        failureToast(
                          error: _.failure!.error!,
                          context: context,
                        );
                      }
                    },
                  );
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

bool emailsAreIdentical({
  required String email,
  required String emailAgain,
}) {
  return email == emailAgain;
}

bool infoChanged({required User user, required User oldUser}) {
  return user.email != oldUser.email ||
      user.name != oldUser.name ||
      user.surname != oldUser.surname ||
      user.photo_url != oldUser.photo_url;
}

Future<void> _submit({
  required WidgetRef ref,
  required TextEditingController emailController,
  required TextEditingController emailAgainController,
  required TextEditingController nameController,
  required TextEditingController surnameController,
  required TextEditingController passwordController,
  required BuildContext context,
}) async {
  final authState = ref.watch(authStateNotifierProvider);
  final oldUser = authState.maybeMap(
    orElse: () {},
    authenticated: (_) => _.user,
  );
  final isIdentical = emailsAreIdentical(
    email: emailController.text,
    emailAgain: emailAgainController.text,
  );
  if (isIdentical) {
    final state = ref.read(authStateNotifierProvider);
    state.maybeMap(
      orElse: () {},
      authenticated: (_) async =>
          await ref.read(authStateNotifierProvider.notifier).updateUser(
                token: _.user.token,
                username: _.user.username,
                password: passwordController.text,
                photoUrl: 'https://tylefnx.example.com',
                email: emailController.text,
                name: nameController.text,
                surname: surnameController.text,
              ),
    );
    authState.maybeMap(
      orElse: () {},
      authenticated: (_) {
        if (infoChanged(user: _.user, oldUser: oldUser!)) {
          context.maybePop();
        }
      },
    );
  }
}

void initializeProfileInfos({
  required TextEditingController nameController,
  required TextEditingController surnameController,
  required TextEditingController emailController,
  required TextEditingController emailAgainController,
  required WidgetRef ref,
}) {
  final authState = ref.watch(authStateNotifierProvider);
  useEffect(
    () {
      return authState.maybeMap(
        orElse: () {
          return null;
        },
        authenticated: (_) {
          nameController.text = _.user.name ?? '';
          surnameController.text = _.user.surname ?? '';
          emailAgainController.text = _.user.email ?? '';
          emailController.text = _.user.email ?? '';
          return null;
        },
      );
    },
    [],
  );
}

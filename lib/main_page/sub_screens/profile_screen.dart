import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gymlogger/authentication/shared/providers.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';
import 'package:gymlogger/core/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateNotifierProvider);
    return authState.maybeMap(
      orElse: () => const Scaffold(),
      authenticated: (_) => Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(child: ProfilePictureWidget()),
              SB_AppPadding.h10(),
              ListTile(
                tileColor: Colors.grey[200],
                leading: const Icon(Icons.person),
                title: AppText.bold(text: 'Username:'),
                subtitle: AppText.bold(text: _.user.username),
              ),
              ListTile(
                tileColor: Colors.white,
                leading: const Icon(Icons.mail),
                title: AppText.bold(text: 'Email:'),
                subtitle: AppText.bold(text: _.user.email ?? 'Email not found'),
              ),
              ListTile(
                tileColor: Colors.grey[200],
                leading: const Icon(Icons.person_pin),
                title: AppText.bold(text: 'Full Name:'),
                subtitle: AppText.bold(
                  text: '${_.user.name} ${_.user.surname}',
                ),
              ),
              ListTile(
                tileColor: Colors.white,
                leading: const Icon(Icons.star),
                title: AppText.bold(text: 'Overall Level:'),
                subtitle: AppText.bold(text: 'Elite'),
              ),
              AppPadding.h10(
                child: AppButton(
                  onPressed: () =>
                      AutoRouter.of(context).push(const UpdateUserRoute()),
                  title: 'Update Profile',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ClipOval(
      child: ColoredBox(
        color: Colors.grey,
        child: Icon(
          Icons.person_2_rounded,
          size: 128,
        ),
      ),
    );
  }
}

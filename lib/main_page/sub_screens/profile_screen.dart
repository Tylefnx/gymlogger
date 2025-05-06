import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gymlogger/authentication/shared/providers.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateNotifierProvider);

    return authState.maybeMap(
      orElse: () => const Scaffold(),
      authenticated: (_) => AppPadding.h10v20(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ProfilePictureWidget(),
              SBAppPadding.h10(),
              _ProfileInfoTile(
                  icon: Icons.person,
                  label: 'Username',
                  value: _.user.username),
              _ProfileInfoTile(
                  icon: Icons.mail,
                  label: 'Email',
                  value: _.user.email ?? 'Email not found'),
              _ProfileInfoTile(
                  icon: Icons.person_pin,
                  label: 'Full Name',
                  value: '${_.user.name} ${_.user.surname}'),
              const _ProfileInfoTile(
                  icon: Icons.star, label: 'Overall Level', value: 'Elite'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔹 Profil Fotoğrafı (Kompakt)
class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.deepPurpleAccent.withOpacity(0.2),
        child: const Icon(Icons.person_2_rounded,
            size: 72, color: Colors.deepPurple),
      ),
    );
  }
}

// 🔹 Kullanıcı Bilgileri İçin Kart Bileşeni
class _ProfileInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ProfileInfoTile(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: [
            Icon(icon, color: Colors.deepPurple),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.bold(text: label),
                AppText.normal(text: value),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

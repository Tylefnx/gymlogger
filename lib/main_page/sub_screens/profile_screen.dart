import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              subtitle: AppText.bold(text: 'EliteLifter'),
            ),
            ListTile(
              tileColor: Colors.white,
              leading: const Icon(Icons.mail),
              title: AppText.bold(text: 'Email:'),
              subtitle: AppText.bold(text: 'abuzerkomurcu@gmail.com'),
            ),
            ListTile(
              tileColor: Colors.grey[200],
              leading: const Icon(Icons.person_pin),
              title: AppText.bold(text: 'Full Name:'),
              subtitle: AppText.bold(text: 'Abuzer Kömürcü'),
            ),
            ListTile(
              tileColor: Colors.white,
              leading: const Icon(Icons.star),
              title: AppText.bold(text: 'Overall Level:'),
              subtitle: AppText.bold(text: 'Elite'),
            ),
          ],
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

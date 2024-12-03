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
          children: [
            const ProfilePictureWidget(),
            SB_AppPadding.h10(),
            AppText.little_big_bold(text: 'EliteLifter'),
            AppText.little_big_bold(text: 'abuzerkomurcu@gmail.com'),
            AppText.little_big_bold(text: 'Abuzer Kömürcü'),
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

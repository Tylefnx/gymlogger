import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';

class ExtraLongWidgetForDecoratedBoxUsageWidget extends HookWidget {
  const ExtraLongWidgetForDecoratedBoxUsageWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final backgroundImage = useMemoized(
      () => const AssetImage('assets/images/background.jpg'),
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: AppPadding.h30v40(
                    child: child,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

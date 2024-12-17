import 'package:flutter/material.dart';
import 'package:gymlogger/core/presentation/app_durations.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:toastification/toastification.dart';

ToastificationItem failureToast({
  required String error,
  required BuildContext context,
}) {
  return toastification.show(
    type: ToastificationType.error,
    context: context,
    autoCloseDuration: toastDuration,
    title: AppText.normal(text: error),
  );
}

ToastificationItem successToast({
  required String success,
  required BuildContext context,
}) {
  return toastification.show(
    type: ToastificationType.success,
    context: context,
    autoCloseDuration: toastDuration,
    title: AppText.normal(text: success),
  );
}

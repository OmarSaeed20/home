import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/widget/app_text/text_styles.dart';
import '/core/widget/app_text/text_widget.dart';

class Utils {
  const Utils._();

  static void showToast(
    String text, {
    Color? backgroundColor,
    Color? textColor,
    int? duration,
  }) =>
      Get.showSnackbar(
        GetSnackBar(
          maxWidth: Get.context!.size!.width - 50,
          // behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: duration ?? 4),
          messageText: TextWidget(
            text,
            style:
                HomeTxStyle.gStyle16.copyWith(color: textColor ?? Colors.white),
          ),
          borderRadius: 10,
          backgroundColor: backgroundColor ?? Colors.green.withOpacity(0.7),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
      );

  static void showErrorToast(String text, {int? duration}) =>
      showToast(text, backgroundColor: Colors.red.withOpacity(0.7));
}

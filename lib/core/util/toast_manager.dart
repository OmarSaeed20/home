import 'package:home/new_app/data/extensions.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/consts/app_colors.dart';
import '/core/consts/app_strings.dart';
import '/core/widget/app_text/text_styles.dart';
import '/core/widget/app_text/text_widget.dart';

class ToastManager {
  const ToastManager._();
  static void showSnak(String? msg, {IconData? icon, bool isSuc = true}) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    bool isWifiError = msg.valide().contains("No internet connection".tr);
    Get.showSnackbar(
      GetSnackBar(
        duration: Duration(seconds: isSuc ? 3 : 5),
        leftBarIndicatorColor:
            isSuc ? Colors.green.shade900 : Colors.red.shade900,
        backgroundColor: isSuc ? KColors.whiteNice : KColors.black,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 2),
        icon: Icon(
          isWifiError
              ? Icons.wifi_2_bar_rounded
              : icon ?? (isSuc ? Icons.check : Icons.error),
          color: isSuc ? Colors.green.shade900 : Colors.red.shade900,
        ),
        messageText: TextWidget(
          msg.isEmptyOrNul ? (isSuc ? "" : KStrings.somethingWrong.tr) : msg,
          style: HomeTxStyle.gStyle14
              .copyWith(color: isSuc ? KColors.textColor : KColors.white),
        ),
      ),
    );
  }
}

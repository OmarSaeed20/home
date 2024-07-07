import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/core/consts/app_colors.dart';
import '/core/consts/app_strings.dart';
import 'package:home/new_app/data/extensions.dart';
import '/core/widget/app_text/text_styles.dart';
import '/core/widget/app_text/text_widget.dart';

snackBarMessage({required String msg, String? title}) {
  if (Get.isSnackbarOpen) {
    Get.closeAllSnackbars();
  }
  bool isWifiError = msg.valide().contains("No internet connection".tr);
  Get.showSnackbar(
    GetSnackBar(
      snackPosition: SnackPosition.TOP,
      duration: const Duration(milliseconds: 6000),
      backgroundColor: KColors.black,
      leftBarIndicatorColor: KColors.red,
      margin: EdgeInsets.all(3.w),
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h, right: 2.w),
      icon: Icon(
        isWifiError ? Icons.wifi_find_rounded : Icons.warning_outlined,
        // CupertinoIcons.exclamationmark_bubble,
        // color: KColors.pointsColo,
        size: 3.2.h,
      ),
      titleText: !isWifiError
          ? TextWidget(
              title ?? KStrings.alert.tr,
              style: HomeTxStyle.gStyle14
                  .copyWith(fontWeight: FontWeight.w700, color: KColors.white),
            )
          : null,
      messageText: TextWidget(
        msg.isEmptyOrNul ? KStrings.somethingWrong.tr : msg,
        style: HomeTxStyle.gStyle12.copyWith(color: KColors.white),
      ),
    ),
  );
}

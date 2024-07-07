import 'package:flutter/material.dart';
import 'package:get/get.dart';
 

class AppConstants {
  static bool isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static bool get isIos =>
      // (defaultTargetPlatform == TargetPlatform.iOS)
      ((GetPlatform.isMacOS || GetPlatform.isIOS));
  static const int zero = 0;
  static const String empty = '';
  static List<BoxShadow> get boxShadow => [
        BoxShadow(
          color: const Color(0xFFAAAAAA).withOpacity(0.15),
          blurRadius: 5,
          offset: const Offset(-2, 2),
        ),
      ];


}

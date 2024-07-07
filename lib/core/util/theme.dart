import 'package:flutter/material.dart';
import '/core/consts/app_colors.dart';
import '/core/widget/app_text/text_styles.dart';

ThemeData get getThemeData => ThemeData(
      scaffoldBackgroundColor: KColors.scaffoldBg,
      primaryColor: KColors.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: KColors.primary,
        secondary: KColors.primary.withOpacity(.5),
      ),
      useMaterial3: true,
      fontFamily: HomeTxStyle.fontFamily,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      dividerTheme:
          const DividerThemeData(color: KColors.fillBorder, thickness: 1.5),
    );

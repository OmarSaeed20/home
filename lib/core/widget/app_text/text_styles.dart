import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/consts/app_colors.dart';

abstract final class HomeTxStyle {
  static const String fontFamily = "Almarai";
  static const String fontFamilyNotoSans = "NotoSans";
  static const String fontfamilyTitilliumWeb = 'TitilliumWeb';

  static final TextStyle gStyle28 = ATxStyle._(
    size: 28,
    height: 42,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    color: KColors.txPrimary,
  );

  static final TextStyle gStyle24 = ATxStyle._(
    size: 24,
    height: 36,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    color: KColors.txPrimary,
  );
  static final TextStyle gStyle20 = ATxStyle._(
    size: 20,
    height: 30,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    color: KColors.txPrimary,
  );
  static final TextStyle gStyle18 = ATxStyle._(
    size: 18,
    height: 27,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    color: KColors.txPrimary,
  );
  static final TextStyle gStyle16 = ATxStyle._(
    size: 16,
    height: 24,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    color: KColors.txPrimary,
  );
  static final TextStyle gStyle14 = ATxStyle._(
    size: 14,
    height: 21,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    color: KColors.txPrimary,
  );
  static final TextStyle gStyle12 = ATxStyle._(
    size: 12,
    height: 18,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    color: KColors.txPrimary,
  );
}

final class ATxStyle extends TextStyle {
  ATxStyle._({
    required double size,
    required double height,
    required String super.fontFamily,
    required Color super.color,
    required FontWeight super.fontWeight,
  }) : super(
          fontSize: size.sp,
          height: height / size,
          fontFeatures: const [
            FontFeature.notationalForms(),
            FontFeature.slashedZero(),
            FontFeature.tabularFigures(),
          ],
        );
}

/* TextStyle gStyle24({
  double? letterSpacing,
  double? hei,
  TextDecoration? decoration,
  Color color = KColors.textColor,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    _style(
      size: 24,
      fontWeight: fontWeight,
      height: hei,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle DMTextStyle.gStyle20.copyWith({
  double? letterSpacing,
  double? hei,
  TextDecoration? decoration,
  Color color = KColors.black,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    _style(
      size: 20,
      fontWeight: fontWeight,
      height: hei,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle DMTextStyle.gStyle18.copyWith({
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
  Color color = KColors.black,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    _style(
      size: 18,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle gStyle16({
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
  Color color = KColors.black,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    _style(
      size: 16,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle gStyle14({
  double? letterSpacing,
  double? height,
  String? fontFamily,
  TextDecoration? decoration,
  Color? color = KColors.black,
  double? wordSpacing,
  double fontSize = 14,
  FontWeight? fontWeight,
}) =>
    _style(
      size: fontSize,
      letterSpacing: letterSpacing,
      decoration: decoration,
      fontWeight: fontWeight,
      height: height,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle DMTextStyle.gStyle12.copyWith({
  double? letterSpacing,
  double? hei,
  String? fontFamily,
  TextDecoration? decoration,
  Color? color,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    _style(
      size: 12,
      letterSpacing: letterSpacing,
      decoration: decoration,
      fontWeight: fontWeight,
      height: hei,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle gStyle10({
  double? letterSpacing,
  double? height,
  String? fontFamily,
  TextDecoration? decoration,
  Color color = KColors.textGray,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    _style(
      size: 10,
      letterSpacing: letterSpacing,
      decoration: decoration,
      fontWeight: fontWeight,
      height: height,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle _style({
  String? fontFamily = "NotoSans",
  Color? color = KColors.textColor,
  Color? backgroundColor,
  double size = 14,
  FontWeight? fontWeight = FontWeight.w400,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextBaseline? textBaseline,
  double? height,
  Locale? locale,
  Paint? foreground,
  Paint? background,
  List<Shadow>? shadows,
  List<FontFeature>? fontFeatures,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
}) {
  try {
    return TextStyle(
      fontFamily: fontFamily,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: size.sp,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  } catch (ex) {
    return TextStyle(
      fontFamily: "NotoSans",
      color: color,
      backgroundColor: backgroundColor,
      fontSize: size.sp,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }
}

 */
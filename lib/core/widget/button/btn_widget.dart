import 'package:flutter/material.dart';
import 'package:home/new_app/data/extensions.dart';
import '/core/consts/app_colors.dart';
import '/core/util/enums.dart';
import '/core/widget/app_text/text_styles.dart';
import '/core/widget/app_text/text_widget.dart';
import '/core/widget/loading_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button_animation.dart';

class BtnWidget extends StatelessWidget {
  const BtnWidget({
    super.key,
    required this.onTap,
    this.error,
    this.title,
    this.bGColor,
    this.titleColor = KColors.white,
    this.textStyle,
    this.child,
    this.height = 55,
    this.width,
    this.radius = 8,
    this.milliseconds = 250,
    this.enableWidth = false,
    this.border,
    this.margin,
    this.padding,
    this.rx = RequestState.none,
    this.curve = Curves.easeInOutExpo,
  });
  final String? title, error;

  final VoidCallback? onTap;
  final BoxBorder? border;
  final Color? bGColor, titleColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? margin, padding;
  final double radius;
  final double? height, width;
  final int milliseconds;
  final Widget? child;
  final bool enableWidth;
  final Curve curve;
  final RequestState rx;

  @override
  Widget build(BuildContext context) => ButtonAnimation(
        onTap: rx.isLoading ? () {} : onTap!,
        child: AnimatedContainer(
          alignment: Alignment.center,
          margin: margin,
          padding: rx.isLoading ? 4.padAll : padding,
          curve: curve,
          duration: Duration(milliseconds: milliseconds),
          height:
              (/* MediaQuery.sizeOf(context).width < 350 ? 44 : */ height)?.h,
          width: rx.isLoading
              ? height?.h
              : enableWidth
                  ? width
                  : width ?? (MediaQuery.sizeOf(context).width - 32).w,
          decoration: BoxDecoration(
            border: border,
            borderRadius: (rx.isLoading ? 200 : radius).radius,
            color:
                rx.isError ? const Color(0xFFE33629).withOpacity(.20) : bGColor,
          ),
          child: rx.isLoading ? const LoadingWidget() : _btnBody,
        ),
      );

  Widget get _btnBody => switch (title) {
        null => child!,
        _ => FittedBox(
            fit: BoxFit.scaleDown,
            child: TextWidget(
              title,
              textAlign: TextAlign.center,
              style: textStyle ??
                  HomeTxStyle.gStyle16.copyWith().copyWith(
                        color:
                            rx.isError ? const Color(0xFFE33629) : titleColor,
                        fontSize: 17,
                      ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
      };
}

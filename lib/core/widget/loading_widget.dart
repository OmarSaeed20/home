import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/consts/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.valueColor = KColors.white,
    this.height,
    this.color = KColors.primary,
    this.strokeWidth = 3.0,
  });
  final Color color, valueColor;
  final double strokeWidth;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Center(
      // import 'package:flutter_spinkit/flutter_spinkit.dart'
      // child: const SpinKitDoubleBounce(color: ColorManager.mainApp),
      // Loader().visible(true), // np_utils
      child: SizedBox(
        height: height?.h,
        width: height?.h,
        child: CircularProgressIndicator.adaptive(
          backgroundColor: color,
          valueColor: AlwaysStoppedAnimation<Color>(valueColor),
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}

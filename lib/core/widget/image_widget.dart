import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home/new_app/data/extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/consts/app_colors.dart';
import '/core/widget/loading_widget.dart';

import 'shimmer_widget.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.path,
    this.name,
    this.fit,
    this.height,
    this.width,
    this.color,
    this.onTap,
    this.message,
    this.padding,
    this.failerImg,
    this.onLongPress,
    this.colorFilter,
    this.loadingBuilder,
    this.errorWidget,
  });
  final dynamic path;
  final BoxFit? fit;
  final double? height, width;
  final Color? color;
  final Widget Function(double? progress)? loadingBuilder;
  final VoidCallback? onTap, onLongPress;
  final String? failerImg, message, name;
  final EdgeInsetsGeometry? padding;
  final Widget? errorWidget;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    var he = height?.h;
    var wi = width?.w;

    Widget getImage() {
      // //debugPrint("img type>>> ${path.runtimeType}");
      switch (path.runtimeType) {
        // ignore: type_literal_in_constant_pattern
        case Uint8List:
          return Image.memory(
            path,
            fit: fit,
            color: color,
            height: he,
            width: wi,
            semanticLabel: name,
          );

        default:
          if (path is String) {
            if (path.endsWith('.svg')) {
              return SvgPicture.asset(
                path,
                fit: fit ?? BoxFit.contain,
                height: he,
                semanticsLabel: name,
                width: wi,
                colorFilter: color != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null,
              );
            } else if (path.startsWith('http') ||
                path.startsWith('https') ||
                path.startsWith('www.')) {
              return CachedNetworkImage(
                imageUrl: path,
                fit: fit,
                width: wi,
                height: he,
                colorBlendMode: BlendMode.srcIn,
                errorWidget: (BuildContext context, _, stackTrace) {
                  if (failerImg != null) {
                    return Container(
                      height: he?.h,
                      width: wi?.h,
                      alignment: AlignmentDirectional.center,
                      child: ImageWidget(
                        path: failerImg,
                        fit: fit,
                        height: he?.h,
                        width: wi?.h,
                      ),
                    );
                  } else {
                    return Container(
                      height: he?.h,
                      width: wi?.h,
                      decoration: BoxDecoration(
                        color: KColors.white,
                        // shape: BoxShape.circle,
                        border: Border.all(color: KColors.fillBorder),
                      ),
                      alignment: AlignmentDirectional.center,
                      // child: const Skeleton.shade(
                      //   child: ImageWidget(path: Kimage.camira3d),
                      // ),
                      child: const Icon(Icons.error),
                    );
                  }
                },
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    loadingBuilder != null
                        ? loadingBuilder!(downloadProgress.progress)
                        : Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              ShimmerWidget(
                                child: Container(
                                  height: he,
                                  width: wi,
                                  decoration: const BoxDecoration(
                                    color: KColors.fillColor,
                                    // borderRadius: 32.radius,
                                  ),
                                  // alignment: Alignment.center,
                                  // child: CircularProgressIndicator.adaptive(
                                  //   backgroundColor: KColors.white,
                                  //   valueColor: const AlwaysStoppedAnimation(KColors.primary),
                                  //   value: progress,
                                  // ),
                                  // child: ImageWidget(
                                  //   // height: (height ?? (context.isTablet ? 215 : 168)),
                                  //   // width: context.width,
                                  //   fit: BoxFit.fill,
                                  //   path: Kimage.logo,
                                  //   color: KColors.white,
                                  // ),
                                ),
                              ),
                              CircularProgressIndicator.adaptive(
                                backgroundColor: KColors.white,
                                valueColor: const AlwaysStoppedAnimation(
                                  KColors.primary,
                                ),
                                value: downloadProgress.progress,
                                strokeWidth: 3,
                              ),
                            ],
                          ), /* Center(
                            child:
                             CircularProgressIndicator.adaptive(
                              backgroundColor: KColors.white,
                              valueColor:
                                  const AlwaysStoppedAnimation(KColors.primary),
                              value: downloadProgress.progress,
                            ),
                          ), */
              );
            }
          }
          return Image.asset(
            path,
            fit: fit,
            color: color,
            height: he,
            width: wi,
            semanticLabel: name,
          );
      }
    }

    var child = path != null
        ? ((onTap != null)
            ? IconButton(
                // padding:
                //     (onTap != null && padding != null) ? padding : EdgeInsets.zero,
                onPressed: onTap,
                icon: getImage(),
              )
            : Padding(
                padding: padding ?? 0.padAll,
                child: getImage(),
              ))
        /* TextButton(
            onLongPress: onLongPress,
            onPressed: onTap,
            style: onTap == null
                ? null
                : ButtonStyle(
                    padding: WidgetStatePropertyAll(padding ?? gPadding()),
                    shape: const WidgetStatePropertyAll(CircleBorder()),
                  ),
            child: getImage(),
          ) */
        : errorWidget ??
            Container(
              margin: 25.padAll,
              height: he,
              width: wi,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: KColors.fillBorder),
              ),
              child: const Icon(Icons.error),
            );
    if (colorFilter != null) {
      return ColorFiltered(colorFilter: colorFilter!, child: child);
    }
    return child;
  }
}

class CircleImageNetWork extends StatelessWidget {
  const CircleImageNetWork({
    super.key,
    required this.url,
    this.size = 40,
    this.bColor,
    this.borderColor = KColors.fillBorder,
  });
  final String? url;
  final double size;
  final Color? bColor, borderColor;
  @override
  Widget build(BuildContext context) => Container(
        height: size.h,
        width: size.h,
        // image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(url)),
        decoration: BoxDecoration(shape: BoxShape.circle, color: bColor),
        child: ClipRRect(
          borderRadius: 200.radius,
          child: CachedNetworkImage(
            imageUrl: url ?? "",
            width: size.h,
            height: size.h,
            fit: BoxFit.cover,
            errorWidget: (BuildContext context, _, stackTrace) => Center(
              child: Container(
                width: size.h,
                height: size.h,
                alignment: AlignmentDirectional.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // border: Border.all(color: borderColor!),
                ),
                child: const Icon(Icons.error),
              ),
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: KColors.white,
                valueColor: const AlwaysStoppedAnimation(KColors.primary),
                value: downloadProgress.progress,
                strokeWidth: 2.5,
              ),
            ),
          ),
        ),
      );
}

class CircleImageSvg extends StatelessWidget {
  const CircleImageSvg({
    super.key,
    required this.path,
    this.isLoading = false,
    this.size = 50,
    this.backgroundColor,
    this.isBorder = true,
    this.borderColor,
    this.color,
    this.callback,
  });
  final String? path;
  final bool isLoading, isBorder;
  final double size;
  final Color? backgroundColor, color, borderColor;
  final VoidCallback? callback;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: callback,
        child: Container(
          height: size.h,
          width: size.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
            border: isBorder == true
                ? Border.all(color: borderColor ?? KColors.fillBorder)
                : null,
          ),
          child: Center(
            child: isLoading == true
                ? const LoadingWidget()
                : ClipRRect(
                    borderRadius: 200.radius,
                    child: Visibility(
                      visible: path != null,
                      child: SvgPicture.asset(
                        path!,
                        height: 22.5.h,
                        width: 22.5.h,
                        // ignore: deprecated_member_use
                        color: color,
                      ),
                    ),
                  ),
          ),
        ),
      );
}

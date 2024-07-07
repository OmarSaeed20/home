import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home/core/consts/app_colors.dart';
import 'package:home/core/consts/app_images.dart';
import 'package:home/core/consts/app_strings.dart';
import 'package:home/core/widget/image_widget.dart';
import 'package:home/new_app/data/extensions.dart';
import 'package:home/new_app/routes/app_pages.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    this.onChanged,
  });
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 16.padVertical,
      constraints: BoxConstraints(maxHeight: 50.h, minHeight: 46.h),
      decoration: BoxDecoration(
        borderRadius: 16.radiusAll,
        /* boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            spreadRadius: 0.5,
            blurRadius: 1,
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ], */
      ),
      // color: KColors.primary,
      child: Hero(
        tag: "/_search",
        child: CustomSearchBar(onChanged: onChanged),
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.onChanged,
    this.controller,
    this.padding,
  });
  final void Function(String)? onChanged;
  final EdgeInsetsDirectional? padding;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Material(
        elevation: 4,
        borderRadius: 16.radiusAll,
        shadowColor: KColors.fillBorder2,
        // shadowColor: const Color.fromRGBO(0, 0, 0, 0.08),
        // shape: BeveledRectangleBorder(borderRadius: 16.radiusAll),
        child: Container(
          constraints: BoxConstraints(maxHeight: 50.h, minHeight: 46.h),
          decoration: BoxDecoration(
            borderRadius: 16.radiusAll,
            color: KColors.white,
            boxShadow: const [
              /*   BoxShadow(
                color: KColors.grey,
                // spreadRadius: 0.5,
                blurRadius: 5,
                blurStyle: BlurStyle.outer,
                offset: Offset(0, 4),
              ), */
            ],
          ),
          child: TextFormField(
            cursorRadius: 16.radiusCircular,
            onChanged: onChanged,
            controller: controller,
            readOnly: Get.currentRoute == NewAppRoutes.main,
            decoration: InputDecoration(
              contentPadding: gPadding(),
              prefixIcon: Container(
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: 8.radiusCircular,
                    bottomLeft: 8.radiusCircular,
                  ),
                ),
                alignment: Alignment.center,
                child: const ImageWidget(
                  path: Kimage.searchIcon,
                  height: 24,
                  width: 24,
                  // color: Theme.of(context).primaryColor.withOpacity(.6),
                ),
              ),
              border: InputBorder.none,
              hintText: KStrings.searchHere.tr,
              /*           suffixIcon: !searchMude.isFrRegister
                  ? TxtBtn(
                      const Icon(Icons.filter_list, color: KColors.primary),
                      shape: const WidgetStatePropertyAll(CircleBorder()),
                      onTap: () => baseBottomSheet(context, children: [
                        const MainAppBarFilterBottomSheetBody(),
                      ]),
                    )
                  : null,
           */
              focusedBorder: OutlineInputBorder(
                borderRadius: 16.radius,
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: 16.radius,
                borderSide: BorderSide.none,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: 16.radius,
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.white,
              filled: true,
            ),
            onTap: () async {
              var enabled = Get.currentRoute != NewAppRoutes.main;
              if (!enabled) {
                Get.toNamed(NewAppRoutes.searchService);
              }
            },
          ),
        ),
      ),
    );
  }
}

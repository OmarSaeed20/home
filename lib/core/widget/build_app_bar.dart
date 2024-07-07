import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/consts/app_colors.dart';
import 'package:home/new_app/data/extensions.dart';
import '/core/widget/app_text/text_styles.dart';
import '/core/widget/app_text/text_widget.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackAppBar({
    super.key,
    required this.title,
    this.actions,
    this.padding,
    this.showBack,
  });
  final String title;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;
  final bool? showBack;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextWidget(title, style: HomeTxStyle.gStyle20),
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: 25.radiusCircular,
          bottomRight: 25.radiusCircular,
        ),
      ),
      leading: switch (Navigator.canPop(context) || showBack == true) {
        true => IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: KColors.txPrimary,
            ),
          ),
        _ => null,
      },
      actions: [
        ...?actions,
      ],
    );
  }
}

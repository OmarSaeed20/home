import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/core/consts/app_colors.dart';
import 'package:home/core/consts/app_strings.dart';
import 'package:home/core/widget/app_text/text_styles.dart';
import 'package:home/core/widget/app_text/text_widget.dart';
import 'package:home/new_app/data/extensions.dart';
import 'package:home/new_app/routes/app_pages.dart';

import 'title_button.dart';

class SettingCardModel extends Equatable {
  final String title, icon;
  final String? sup;
  const SettingCardModel({
    required this.title,
    required this.icon,
    required this.sup,
  });
  @override
  List<Object?> get props => [title, icon, sup];
}

class BuildSettingCard extends StatelessWidget {
  final List<SettingCardModel> children;
  final int separated;

  const BuildSettingCard({
    required this.children,
    super.key,
    this.separated = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Get.currentRoute == NewAppRoutes.serviceDetails) ...[
          TextWidget(
            KStrings.contactUs.tr,
            style: HomeTxStyle.gStyle18.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 17,
              height: 18.97 / 17,
            ),
          )
        ],
        Container(
          margin: (Get.currentRoute == NewAppRoutes.serviceDetails ? 8 : 16)
                  .padTop +
              24.padBtm,
          decoration: BoxDecoration(
            borderRadius: 8.radiusAll,
            color: separated == 0 ? KColors.white : KColors.scaffoldBg2,
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => separated.sH,
            itemCount: children.length,
            itemBuilder: (context, index) {
              final item = children[index];

              var titleButton = TitleButton(
                title: item.title,
                image: item.icon,
                sup: item.sup,
              );
              return titleButton;
            },
          ),
        )
      ],
    );
  }
}

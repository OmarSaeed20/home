import 'package:flutter_svg/flutter_svg.dart';
import '/core/util/animation/widgets/fade_transition.dart';
import '/core/util/keys.dart';
import '/core/widget/lists/animation_list_vertical_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/new_app/data/extensions.dart';
import '/new_app/presentation/choose_langeuage/controllers/choose_language_controller.dart';
import '/core/consts/app_strings.dart';
import '/core/widget/app_text/text_widget.dart';
import '/core/widget/button/btn_widget.dart';
import '/core/widget/image_widget.dart';
import '/core/consts/app_colors.dart';
import '/core/consts/app_images.dart';
import '/core/widget/app_text/text_styles.dart';

class NewAppChooseLanguageView extends GetView<NewAppChooseLanguageController> {
  const NewAppChooseLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // SAVE LANG BUTTON
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BtnWidget(
              margin: gPadding(bottom: 40, right: 16, left: 16),
              rx: controller.state.value.rx,
              onTap: () => controller.changeLanguage(),
              title: KStrings.save.tr,
              bGColor: KColors.cirBlueBgDeep,
            ),
          ],
        ),
        body: CustomFadeIn(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: 20.padHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  30.sH,
                  Hero(
                    tag: "_logo_",
                    child: ImageWidget(
                      path: Kimage.homeLogoPng,
                      // path: NewAppService.to.newAppData.value?.logo,
                      width: 300,
                      height: 300,
                      loadingBuilder: (context) => const SizedBox.shrink(),
                    ),
                  ),
                  24.sH,

                  /*                   //LOGO
                  ImageWidget(
                    path: NewAppService.to.newAppData.value?.logo,
                    height: 165,
                    fit: BoxFit.fill,
                  ), */
                  //WELCOME MESSAGE
                  /* TextWidget(
                    KStrings.welcomeWithEmotion.tr,
                    style: DMTxStyle.gStyle20
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  15.sH,
                  // WELCOME CHOOSE LANG MESSAGE
                  TextWidget(
                    KStrings.chooseLanguage.tr,
                    textAlign: TextAlign.center,
                    style: DMTxStyle.gStyle16.copyWith(color: KColors.textGray),
                  ), */
                  32.sH,
                  _LanguageRadioBox(
                    index: 1,
                    isChosen: controller.state.value.lang == Keys.ar,
                    value: controller.state.value.lang,
                    groupValue: Keys.ar,
                    onChanged: (value) => controller.onSelectLang(lang: value!),
                    onTap: () => controller.onSelectLang(lang: Keys.ar),
                    text: Keys.ar,
                    image: Kimage.saIcon,
                  ),
                  _LanguageRadioBox(
                    value: controller.state.value.lang,
                    index: 2,
                    groupValue: Keys.en,
                    isChosen: controller.state.value.lang == Keys.en,
                    onChanged: (value) => controller.onSelectLang(lang: value!),
                    onTap: () => controller.onSelectLang(lang: Keys.en),
                    text: Keys.en,
                    image: Kimage.ukIcon,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageRadioBox extends StatelessWidget {
  const _LanguageRadioBox({
    required this.isChosen,
    required this.onChanged,
    required this.value,
    required this.groupValue,
    required this.text,
    required this.image,
    required this.onTap,
    required this.index,
  });
  final bool isChosen;
  final void Function(String?)? onChanged;
  final void Function() onTap;
  final String text, image, groupValue, value;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: gPadding(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: 3.radius,
        border: Border.all(
          color: isChosen ? KColors.primary : KColors.fillBorder,
          width: (isChosen ? .8 : .5).w,
        ),
      ),
      child: AnimationListWidget(
        index: index,
        horizontal: 25,
        child: ListTile(
          contentPadding: gPadding(),
          splashColor: KColors.primary.withOpacity(.2),
          hoverColor: KColors.primary.withOpacity(.2),
          shape: const BeveledRectangleBorder(
              /*   borderRadius: 3.radius,
             side: BorderSide(
              color: isChosen ? KColors.primary : KColors.greyLight,
              width: .5.w,
            ), */
              ),
          title: TextWidget(
            text.tr,
            textAlign: TextAlign.start,
            style: HomeTxStyle.gStyle16.copyWith(fontWeight: FontWeight.w500),
          ),
          onTap: onTap,
          trailing: Radio.adaptive(
            activeColor: KColors.primary,
            value: value,
            groupValue: groupValue,
            onChanged: (value) => onTap,
          ),
          leading: Padding(
            padding: const EdgeInsetsDirectional.all(16),
            child: SvgPicture.asset(image),
          ),
        ),
      ),
    );
  }
}

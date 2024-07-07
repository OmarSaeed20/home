import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home/new_app/presentation/about_us/views/widget/build_setting_card.dart';
import 'package:nb_utils/nb_utils.dart';
import '/core/consts/app_colors.dart';
import '/core/consts/app_images.dart';
import '/core/consts/app_strings.dart';
import '/core/util/animation/widgets/fade_transition.dart';
import '/core/util/enums.dart';
import '/core/widget/app_text/text_styles.dart';
import '/core/widget/app_text/text_widget.dart';
import '/core/widget/app_text/txt_btn.dart';
import '/core/widget/build_app_bar.dart';
import '/core/widget/image_widget.dart';
import '/core/widget/lists/animation_list_vertical_widget.dart';
import '/core/widget/loading_widget.dart';
import '/new_app/data/extensions.dart';
import '/new_app/new_app_service.dart';
import '/new_app/presentation/about_us/controllers/about_us_controller.dart';
import '/new_app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

class NewAppAboutUsView extends StatelessWidget {
  const NewAppAboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewAppAboutUsControllerImp>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: KColors.scaffoldBg2,
          appBar: BackAppBar(title: KStrings.aboutApp.tr),
          body: controller.rx.isLoading
              ? const LoadingWidget()
              : ListView(
                  padding: 30.padTop + 20.padHorizontal,
                  children: [
                    AnimationListWidget(
                      curve: Curves.fastOutSlowIn,
                      horizontal: 300,
                      index: 0,
                      milliseconds: 300 + (0 * 200),
                      child: CustomFadeIn(
                        child: Hero(
                          tag: "_logo_",
                          child: ImageWidget(
                            path: Kimage.homeLogoPng,
                            // path: NewAppService.to.newAppData.value?.logo,
                            width: 300,
                            height: 300,
                            loadingBuilder: (context) =>
                                const SizedBox.shrink(),
                          ),
                        ),
                      ),
                    ),
                    24.sH,
                    AnimationListWidget(
                      curve: Curves.fastOutSlowIn,
                      horizontal: 300,
                      vertical: MediaQuery.sizeOf(context).height * 0.15,
                      index: 1,
                      milliseconds: 300 + (1 * 200),
                      child: CustomFadeIn(
                        child: TextWidget(
                          NewAppService.to.newAppData.value?.siteNameAr
                              .translateDatabase(
                            NewAppService.to.newAppData.value?.siteNameEn,
                          ), // 'We deliver\ngrocery at your\n doorstep',
                          style: HomeTxStyle.gStyle24
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          // padding: (context.width / 4.4).padHorizontal,
                        ),
                      ),
                    ),
                    24.sH,
                    AnimationListWidget(
                      curve: Curves.fastOutSlowIn,
                      horizontal: 300,
                      vertical: MediaQuery.sizeOf(context).height * 0.15,
                      index: 2,
                      milliseconds: 300 + (1 * 200),
                      child: CustomFadeIn(
                        child: TextWidget(
                          NewAppService.to.newAppData.value?.aboutAr
                              .translateDatabase(
                            NewAppService.to.newAppData.value?.aboutEn,
                          ),
                          style: HomeTxStyle.gStyle14,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    24.sH,
                    AnimationListWidget(
                      curve: Curves.fastOutSlowIn,
                      vertical: 300,
                      index: 3,
                      milliseconds: 300 + (3 * 200),
                      child: BuildSettingCard(
                        children: [
                          SettingCardModel(
                            title: KStrings.email.tr,
                            icon: Kimage.sms,
                            sup: NewAppService.to.newAppData.value?.email,
                          ),
                          SettingCardModel(
                            title: KStrings.phone.tr,
                            icon: Kimage.mobile,
                            sup: NewAppService.to.newAppData.value?.phone1,
                          ),
                          SettingCardModel(
                            title: KStrings.phone.tr,
                            icon: Kimage.mobile,
                            sup: NewAppService.to.newAppData.value?.phone2,
                          ),
                          SettingCardModel(
                            title: KStrings.workingHours.tr,
                            icon: "",
                            sup:
                                NewAppService.to.newAppData.value?.workingHours,
                          ),
                          SettingCardModel(
                            title: KStrings.address.tr,
                            icon: Kimage.locationIcon,
                            sup: NewAppService.to.newAppData.value?.address,
                          ),
                          SettingCardModel(
                            title: KStrings.location.tr,
                            icon: Kimage.locationIcon,
                            sup: NewAppService.to.newAppData.value?.location,
                          ),
                        ],
                      ),
                    ),
                    BuildSettingCard(
                      children: [
                        SettingCardModel(
                          icon: Kimage.linkedInIcon,
                          title: "LinkedIn",
                          sup: NewAppService.to.newAppData.value?.linkedinLink,
                        ),
                        SettingCardModel(
                          icon: Kimage.facebookIcon,
                          title: KStrings.facebook,
                          sup: NewAppService.to.newAppData.value?.facebookLink,
                        ),
                        SettingCardModel(
                          icon: Kimage.twitterIcon,
                          title: "Twitter",
                          sup: NewAppService.to.newAppData.value?.twitterLink,
                        ),
                        SettingCardModel(
                          icon: Kimage.instagramIcon,
                          title: "Instagram",
                          sup: NewAppService.to.newAppData.value?.instagramLink,
                        ),
                      ],
                    ),
                    Container(
                      height: .5.h,
                      width: 300.w,
                      alignment: Alignment.center,
                      margin: gPaddingSymmetric(vertical: 24),
                      color: KColors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TxtBtn(
                          TextWidget(
                            KStrings.privacyPolicy.tr,
                            style: HomeTxStyle.gStyle12,
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            Get.toNamed(NewAppRoutes.privacy);
                          },
                        ),
                        Container(
                          height: 6.h,
                          width: 6.h,
                          margin: gPaddingSymmetric(horizontal: 8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: KColors.grey,
                          ),
                        ),
                        TxtBtn(
                          onTap: () {
                            Get.toNamed(NewAppRoutes.terms);
                          },
                          TextWidget(
                            KStrings.termsAndConditions.tr,
                            style: HomeTxStyle.gStyle12,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
        );
      },
    );
  }
}

class SochialIcon extends StatelessWidget {
  const SochialIcon(this.img, {super.key, this.bColor, this.type});
  final String? img, type;
  final Color? bColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse(type.valide());
        if (await canLaunchUrl(uri)) {
          launchUrl(uri);
        } else {
          toast("soon");
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bColor,
          border: Border.all(
            color:
                bColor == null ? const Color(0xFF42413E) : KColors.transparent,
            width: .7.w,
          ),
          borderRadius: 10.radius,
        ),
        height: 40.h,
        width: 40.h,
        margin: gPaddingSymmetric(horizontal: bColor == null ? 10 : 6),
        child: FittedBox(
          fit: img == Kimage.tiktokIcon ? BoxFit.cover : BoxFit.none,
          child: ImageWidget(height: 22.5, width: 22.5, path: img),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
/* Widget DemoT8SettingOptionPattern1(
    BuildContext context, var settingIcon, var heading, var info) {
  void copyText(BuildContext context) {
    if (!info.toString().valide().isEmptyOrNul) {
      Clipboard.setData(ClipboardData(text: info));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: TextWidget(
            '$info copied to clipboard',
            style: HomeTxStyle.gStyle14.copyWith(color: KColors.white),
          ),
        ),
      );
    }
  }

  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    child: InkWell(
      onTap: () async {
        if (!info.toString().valide().isEmptyOrNul) {
          if (info.toString().valide().isURL) {
            LunchHelper.launchURL(info.toString().valide());
          }
          if (info.toString().valide().isPhoneNumber ||
              heading.toString() == KStrings.phone.tr) {
            LunchHelper.launchWhatsapp(info.toString().valide().trim());
          }
        }
      },
      onLongPress: () => copyText(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // color: KColors.cirBlueBg.withOpacity(.4),
                ),
                width: 45,
                height: 45,
                padding: EdgeInsets.all(settingIcon is String ? 8 : 4),
                child: settingIcon is String
                    ? ImageWidget(
                        path: settingIcon,
                        colorFilter: const ColorFilter.mode(
                          KColors.txPrimary,
                          BlendMode.srcIn,
                        ),
                      )
                    : Icon(settingIcon, color: KColors.txPrimary),
              ),
              16.sW,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextWidget(
                    heading,
                    style: HomeTxStyle.gStyle18
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  4.sH,
                  TextWidget(
                    // heading == KStrings.location.tr
                    //     ? "Tap to Open in Map"
                    //     :
                    info,
                    style: HomeTxStyle.gStyle12.copyWith(color: KColors.txInfo),
                  ),
                ],
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios, color: KColors.txPrimary)
        ],
      ),
    ),
  );
}
 */


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tawk/flutter_tawk.dart';
import 'package:get/get.dart';
import 'package:home/core/consts/app_strings.dart';
import 'package:home/core/widget/build_app_bar.dart';
import 'package:home/core/widget/lists/animation_list_vertical_widget.dart';
import 'package:home/core/widget/loading_widget.dart';
import 'package:home/core/widget/slivers/sliver_delegate.dart';

import '/core/consts/app_colors.dart';
import '/core/util/animation/widgets/fade_transition.dart';
import '/core/util/enums.dart';
import '/core/widget/adaptive_widgets/adaptive_refresh_indicator/adaptive_refresh_indicator2.dart';
import '/core/widget/app_text/text_styles.dart';
import '/core/widget/app_text/text_widget.dart';
import '/core/widget/image_widget.dart';
import '/new_app/data/extensions.dart';
import '/new_app/data/model/newapp_services_mode.dart';
import '/new_app/new_app_service.dart';
import '/new_app/presentation/choose_langeuage/controllers/choose_language_controller.dart';
import '/new_app/presentation/main/controllers/new_app_main_controller.dart';
import '/new_app/routes/app_pages.dart';

import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter/services.dart';
import 'widget/search_widget.dart';

class MainBody2 extends StatelessWidget {
  const MainBody2({super.key, required this.ctrl});

  final NewAppMainControllerImp ctrl;

  @override
  Widget build(BuildContext context) {
    return CustomFadeIn(
      child: AdaptiveRefreshIdicator2(
        onRefresh: () async => ctrl.getServices(),
        headerSliverBuilder: [
          if (!ctrl.state.value.rx.isEmpty) ...[
            SliverToBoxAdapter(
              child: Container(
                color: KColors.primary,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                margin: 8.padBtm,
                child: Center(
                  child: TextWidget(
                    '${KStrings.workingHours.tr}: ${NewAppService.to.newAppData.value?.workingHours}',
                    style: HomeTxStyle.gStyle14.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: 16.padHorizontal + 8.padBtm,
              sliver: SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: SliverDelegate(
                  child: Hero(
                    tag: "/_search",
                    child: CustomSearchBar(padding: 16.padTop),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TextWidget(
                KStrings.mainInfo.tr,
                textAlign: TextAlign.start,
                padding: 16.padBtm + 16.padHorizontal,
                style: HomeTxStyle.gStyle18.copyWith(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ],
        body: ListServiceData(ctrl: ctrl),
      ),
    );
  }
}

class ListServiceData extends StatelessWidget {
  const ListServiceData({super.key, required this.ctrl, this.list});

  final NewAppMainControllerImp ctrl;
  final List<NewAppServicesDataMode>? list;

  @override
  Widget build(BuildContext context) {
    Widget homePageCard2({
      required Color color,
      required NewAppServicesDataMode service,
      required BuildContext context,
    }) {
      double w = MediaQuery.of(context).size.width;
      return InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          HapticFeedback.lightImpact();
          Get.toNamed(
            NewAppRoutes.serviceDetails,
            arguments: {'service': service},
          );
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: 8.padHorizontal + 8.padBtm,
          height: w / 2,
          width: w / 2.4,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xff040039).withOpacity(.15),
                blurRadius: 99,
              ),
            ],
            borderRadius: 25.radiusAll,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(),
              Skeleton.leaf(
                child: Container(
                  // height: w / 3.5,
                  // width: w / 3.5,
                  constraints: BoxConstraints(
                    minHeight: w / 3.5,
                    minWidth: w / 3.5,
                  ),
                  padding: 2.padAll,
                  decoration: BoxDecoration(
                    color: color.withOpacity(.3),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        // color: const Color(0xff040039).withOpacity(.15),
                        color: color.withOpacity(.35),
                        blurStyle: BlurStyle.outer,
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Hero(
                    tag: service.id.toString(),
                    child: CircleImageNetWork(url: service.image),
                  ),
                ),
              ),
              GetX<NewAppChooseLanguageController>(
                builder: (c) => TextWidget(
                  c.state.value.lang == "en" ? service.nameEn : service.nameAr,
                  maxLines: 2,
                  softWrap: true,
                  // padding: 4.padTop,
                  overflow: TextOverflow.ellipsis,
                  style: HomeTxStyle.gStyle16.copyWith(
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () => Skeletonizer(
            enabled: ctrl.state.value.rx.isLoading,
            effect: ShimmerEffect(
              baseColor: KColors.grey,
              highlightColor: Colors.grey[100]!,
              duration: const Duration(milliseconds: 700),
            ),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: 8.padVertical,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                ctrl.state.value.rx.isLoading
                    ? 15
                    : (list ?? ctrl.state.value.servcies).length,
                (index) {
                  return AnimationListWidget(
                    index: index,
                    milliseconds: 400 + (index * 200),
                    vertical: 30,
                    curve: Curves.easeOut,
                    child: homePageCard2(
                      color: ctrl.state.value
                          .colors[ctrl.state.value.rx.isLoading ? 1 : index],
                      service: ctrl.state.value.rx.isLoading
                          ? NewAppServicesDataMode(
                              id: index,
                              nameAr: "كاميرات المراقبة",
                              image:
                                  "https://home-services.ndsegypt.com/site/services/1720088290wngUCEnwuPylhPIeEywaOrPMtQK03ykSTThDu3R9.jpg")
                          : (list ?? ctrl.state.value.servcies)[index],
                      context: context,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NewAppMainView extends GetView<NewAppMainControllerImp> {
  const NewAppMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColors.primary,
        leadingWidth: 70.w,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            16.sW,
            GestureDetector(
              onTap: () {
                Get.toNamed(NewAppRoutes.aboutUs);
              },
              child: CircleImageNetWork(
                url: NewAppService.to.newAppData.value?.logo,
                size: 45,
                bColor: Colors.white,
              ),
            ),
          ],
        ),
        title: GetX<NewAppChooseLanguageController>(
          builder: (c) => TextWidget(
            c.state.value.lang == "en"
                ? NewAppService.to.newAppData.value?.siteNameEn
                : NewAppService.to.newAppData.value?.siteNameAr,
            style: HomeTxStyle.gStyle20
                .copyWith(fontSize: 20, color: KColors.white),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(NewAppRoutes.lang);
            },
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                BeveledRectangleBorder(borderRadius: 12.radiusAll),
              ),
            ),
            child: Row(
              children: [
                Obx(
                  () => TextWidget(
                    Get.find<NewAppChooseLanguageController>()
                        .state
                        .value
                        .lang
                        .tr,
                    style: HomeTxStyle.gStyle14.copyWith(color: Colors.white),
                  ),
                ),
                4.sW,
                const Icon(Icons.language, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: MainBody2(ctrl: controller),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: KColors.primary,
        onPressed: () {
          Get.to(
            () => Scaffold(
              appBar: BackAppBar(
                title: NewAppService.to.pref.getLang == "en"
                    ? NewAppService.to.newAppData.value!.siteNameEn!
                    : NewAppService.to.newAppData.value!.siteNameAr!,
              ),
              body: Tawk(
                directChatLink:
                    'https://tawk.to/chat/668684489d7f358570d702ed/1i1un9f4m',
                visitor: TawkVisitor(
                  name: 'Home services',
                  email: 'fcaebce4f7@emailcbox.pro',
                ),
                onLoad: () {
                  if (kDebugMode) {
                    print('Hello Tawk!');
                  }
                },
                onLinkTap: (String url) {
                  // print(url);
                },
                placeholder: const Center(
                  child: LoadingWidget(),
                ),
              ),
            ),
          );
        },
        child: const ImageWidget(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          path: "assets/setting/support_agent.svg",
        ),
      ),
    );
  }
}

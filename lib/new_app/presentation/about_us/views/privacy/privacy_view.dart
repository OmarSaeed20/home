import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/consts/app_strings.dart';
import '/core/util/enums.dart';
import 'package:home/new_app/data/extensions.dart';
import '/core/widget/app_text/text_widget.dart';
import '/core/widget/build_app_bar.dart';
import '/core/widget/loading_widget.dart';
import '/new_app/presentation/about_us/controllers/about_us_controller.dart';

class NewAppPrivacyView extends StatelessWidget {
  const NewAppPrivacyView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewAppAboutUsControllerImp>(
      builder: (controller) {
        return Scaffold(
          appBar: BackAppBar(title: KStrings.privacyPolicy.tr),
          body: controller.rx.isLoading
              ? const LoadingWidget()
              : SingleChildScrollView(
                  padding: 20.padHorizontal,
                  // child: TextWidget(controller.aboutus?.appData.policy),
                  child: const TextWidget(""),
                ),
        );
      },
    );
  }
}

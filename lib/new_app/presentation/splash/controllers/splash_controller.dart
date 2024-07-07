import 'dart:async';

import 'package:get/get.dart';
import '/new_app/app_prefs.dart';
import '/new_app/routes/app_pages.dart';

import 'spalsh_state.dart';

abstract class NewAppSplashController extends GetxController {
  Future<void> navigate();
}

class NewAppSplashControllerImp extends NewAppSplashController {
  NewAppSplashControllerImp({required this.pref});
  final NewAppAppPreferences pref;

  static NewAppSplashControllerImp get to =>
      Get.find<NewAppSplashControllerImp>();

  final Rx<NewAppSplashState> state = const NewAppSplashState().obs;

  @override
  Future<void> navigate() async => Get.offAllNamed(NewAppRoutes.main);

  @override
  void onReady() async {
    // Future.delayed(const Duration(milliseconds: 1500), () async => await navigate());
    super.onReady();
  }
}

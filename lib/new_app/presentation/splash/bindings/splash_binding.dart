import 'package:get/get.dart';
import '/new_app/app_prefs.dart';
import '/new_app/presentation/splash/controllers/splash_controller.dart';

class NewAppSplashBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<NewAppSplashControllerImp>(
        () => NewAppSplashControllerImp(
          pref: Get.find<NewAppAppPreferences>(),
        ),
        fenix: true,
      );
}

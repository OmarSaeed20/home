import 'package:get/get.dart';
import '/new_app/app_prefs.dart';
import '/new_app/presentation/choose_langeuage/controllers/choose_language_controller.dart';

class NewAppChooseLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewAppChooseLanguageController>(
      () => NewAppChooseLanguageControllerImp(Get.find<NewAppAppPreferences>()),
      fenix: true,
    );
  }
}

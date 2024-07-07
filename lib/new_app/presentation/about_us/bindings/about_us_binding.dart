import 'package:get/get.dart';
import '/new_app/presentation/about_us/controllers/about_us_controller.dart';

class NewAppAboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewAppAboutUsControllerImp>(
      () => NewAppAboutUsControllerImp(),
      fenix: true,
    );
  }
}

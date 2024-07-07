import 'package:get/get.dart';
import '/new_app/app_prefs.dart';
import '/new_app/data/repository/wellcome_repo_imp.dart';
import '/new_app/presentation/main/controllers/new_app_main_controller.dart';

class NewAppMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewAppMainControllerImp>(
      () => NewAppMainControllerImp(
        Get.find<NewAppAppPreferences>(),
        Get.find<NewAppRepositoryImp>(),
      ),
      fenix: true,
    );
  }
}

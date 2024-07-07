import 'package:get/get.dart';
import '/core/util/enums.dart';

abstract class NewAppAboutUsController extends GetxController {
  RequestState rx = RequestState.none;
}

class NewAppAboutUsControllerImp extends NewAppAboutUsController {
  static NewAppAboutUsControllerImp get to =>
      Get.find<NewAppAboutUsControllerImp>();
  NewAppAboutUsControllerImp();
}

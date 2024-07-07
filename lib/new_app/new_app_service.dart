import 'dart:async';

import 'package:get/get.dart';
import '/core/network/base/network_exceptions/network_exceptions.dart';
import '/core/network/connection_checker.dart';
import '/core/util/toast_manager.dart';
import '/new_app/data/extensions.dart';
import '/new_app/data/repository/wellcome_repo_imp.dart';

import 'app_prefs.dart';
import 'data/model/newapp_contact_us_model.dart';

class NewAppService extends GetxService {
  NewAppService({
    required this.networkInfo,
    required this.pref,
    required this.repo,
  });
  final NewAppRepositoryImp repo;
  final ConnectionCheckerImpl networkInfo;
  final NewAppAppPreferences pref;
  static NewAppService get to => Get.find<NewAppService>();

  Rx<NewAppCuntactUsDataModel?> newAppData = Rx(null);

  Future<NewAppService> init() async {
    "<== init ........ getNewAppData ==> ".printy();
    // if (networkInfo.isConnected.value == true) {
    "<== getNewAppData ==> ".printy();
    await getNewAppData();
    "<== getNewAppData ==> ".printy();
    // }

    newAppData.listen((value) async {
      if (value != null) {
        await pref.saveNewAppContactUsData(value.toJson());
      }
    });
    return this;
  }

  Future<void> getNewAppData() async {
    final result = await repo.getAppContactUsData();
    result.when(
      failure: (e) {
        ToastManager.showSnak(
          NetworkExceptions.getErrorMessage(e),
          isSuc: false,
        );
      },
      success: (app) {
        newAppData.value = app.data;
      },
    );
  }
}

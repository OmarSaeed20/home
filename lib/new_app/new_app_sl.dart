import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart'; 
import '/core/network/connection_checker.dart'; 
import 'package:shared_preferences/shared_preferences.dart';

import 'app_prefs.dart';
import 'data/api/new_app_client.dart';
import 'data/repository/wellcome_repo_imp.dart';
import 'data/dio/dio.dart';
import 'new_app_service.dart';

Future<void> newAppInjection() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.lazyPut<SharedPreferences>(() => prefs, fenix: true);
  Get.lazyPut<NewAppAppPreferences>(() => NewAppAppPreferences(prefs), fenix: true);
  Get.lazyPut(() => InternetConnectionChecker(), fenix: true);

  await Get.putAsync(() => ConnectionCheckerImpl().init());

  Get.lazyPut<NewAppDioFactory>(() => NewAppDioFactory(), fenix: true);

  //? RepositoryImp

  Get.lazyPut<NewAppRepositoryImp>(
    () => NewAppRepositoryImp(
        Get.find<NewAppClient>(), Get.find<NewAppAppPreferences>()),
    fenix: true,
  );

  //? Data sources
  Get.lazyPut<NewAppClient>(
    () => NewAppClient(Get.find<NewAppDioFactory>().dio),
    fenix: true,
  );

  await Get.putAsync<NewAppService>(
    () => NewAppService(
      networkInfo: Get.find<ConnectionCheckerImpl>(),
      pref: Get.find<NewAppAppPreferences>(),
      repo: Get.find<NewAppRepositoryImp>(),
    ).init(),
  );
}

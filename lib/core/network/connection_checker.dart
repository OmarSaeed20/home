import 'package:get/get.dart';
import 'package:home/new_app/data/extensions.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '/core/util/toast_manager.dart';

class ConnectionCheckerImpl extends GetxService {
  // Observable variable to hold the network status
  RxBool isConnected = false.obs;

  void initializeNetworkStream() {
    InternetConnectionChecker().onStatusChange.listen((status) {
      // Update the isConnected variable based on the network status
      isConnected.value = (status == InternetConnectionStatus.connected);
    });
  }

  Future<ConnectionCheckerImpl> init() async {
    initializeNetworkStream();
    isConnected.listen(
      (value) async {
        if (isConnected.isFalse) {
          ToastManager.showSnak("No internet connection".tr, isSuc: false);
        }
        " isConnected >>> ${isConnected.value}".printy();
      },
    );
    return this;
  }
}

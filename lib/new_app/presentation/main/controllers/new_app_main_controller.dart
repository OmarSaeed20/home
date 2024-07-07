import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/functions/handele_function_return.dart';
import '/new_app/app_prefs.dart';
import '/new_app/data/repository/wellcome_repo_imp.dart';
import '/core/util/enums.dart';

import 'new_app_main_state.dart';

abstract class NewAppMainController extends GetxController {
  Future<void> getServices();
  final Rx<NewAppMainState> state = const NewAppMainState().obs;
}

class NewAppMainControllerImp extends NewAppMainController {
  NewAppMainControllerImp(this.pref, this.repo);
  final NewAppAppPreferences pref;
  final NewAppRepositoryImp repo;
  @override
  getServices() async {
    state(state.value.copyWith(rx: handleRxLoading()));
    final result = await repo.getService();

    result.when(
      failure: (e) => state(state.value.copyWith(rx: handleRxFailure(e))),
      success: (data) {
        _generateRandomColors(count: data.data?.length ?? 10);
        state(state.value.copyWith(
          servcies: data.data,
          rx: RequestState.success,
        ));
      },
    );
  }

  void _generateRandomColors({int count = 3}) {
    Random random = Random();
    final result = List<Color>.from(state.value.colors);
    for (int i = 0; i < count; i++) {
      result.add(
        Color.fromARGB(
          255,
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
        ),
      );
    }
    state(state.value.copyWith(colors: result));
  }

  @override
  void onInit() async {
    await getServices();
    super.onInit();
  }
}

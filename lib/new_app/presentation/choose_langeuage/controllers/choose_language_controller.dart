import 'package:nb_utils/nb_utils.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/functions/handele_function_return.dart';
import '/core/util/keys.dart';
import '/new_app/app_prefs.dart';
import '/core/util/enums.dart';

import 'choose_language_state.dart';

abstract class NewAppChooseLanguageController extends GetxController {
  onSelectLang({required String lang});
  changeLanguage();
  final Rx<NewAppChooseLanguageState> state =
      const NewAppChooseLanguageState().obs;
}

class NewAppChooseLanguageControllerImp extends NewAppChooseLanguageController {
  NewAppChooseLanguageControllerImp(this._appPreferences);
  final NewAppAppPreferences _appPreferences;

  @override
  onSelectLang({required String lang}) => switch (lang) {
        (Keys.ar || Keys.en) => {
            state(state.value.copyWith(lang: lang)),
            Get.updateLocale(Locale(lang)),
          },
        _ => toast("soon".tr),
      };

  @override
  changeLanguage() async {
    state(state.value.copyWith(rx: handleRxLoading()));
    await _appPreferences.setLang(state.value.lang).then(
          (value) => {
            Get.back(),
            state(state.value.copyWith(rx: RequestState.success)),
          },
        );
  }

  @override
  void onInit() {
    //debugPrint(state.value.lang);
    //debugPrint(_appPreferences.getLang);
    state(state.value.copyWith(lang: _appPreferences.getLang));
    //debugPrint("state.value.lang");
    //debugPrint(state.value.lang);
    //debugPrint(_appPreferences.getLang);
    super.onInit();
  }
}

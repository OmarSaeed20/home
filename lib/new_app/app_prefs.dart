import 'dart:convert';

import '/core/util/keys.dart';
import '/new_app/data/model/newapp_contact_us_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:get/get.dart';

class NewAppAppPreferences {
  final SharedPreferences prefs;
  NewAppAppPreferences(this.prefs);
  static NewAppAppPreferences get to => Get.find<NewAppAppPreferences>();

  //*   >>>>>>>>>>>>>>>>>>>> wellcom <<<<<<<<<<<<<<<<<
  //? Onboarding
  Future<bool> get onSubmittedOnboarding async =>
      prefs.setBool(Keys.onboarding, true);
  bool get getOnboarding => prefs.getBool(Keys.onboarding) ?? false;

  //*   >>>>>>>>>>>>>>>>>>>> language <<<<<<<<<<<<<<<<<

  //? language key
  Future<bool> setLang(String code) async =>
      await prefs.setString(Keys.languageCode, code);
  String get getLang => prefs.getString(Keys.languageCode) ?? "ar";

  Future<void> saveNewAppContactUsData(Map<String, dynamic> data) async {
    String jsonData = jsonEncode(data); // Convert map to JSON string
    await prefs.setString('user_data', jsonData);
  }

  Future<NewAppCuntactUsDataModel?> get getNewAppContactUsData async {
    String? jsonData = prefs.getString('user_data');
    if (jsonData != null) {
      return NewAppCuntactUsDataModel.fromJson(jsonDecode(jsonData));
    }
    return null;
  }
}

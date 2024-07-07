import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:home/core/languages/ar_translations.dart';
import 'package:home/new_app/app_prefs.dart';
import '/core/util/keys.dart'; 

class LocalizationsHelper {
  const LocalizationsHelper._();

  static String getLanguage(BuildContext context) =>
      Localizations.localeOf(context).languageCode;

  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  static Map<String, Map<String, String>>? get translationsKeys =>
      const {Keys.ar: ar, Keys.en: en};

  static List<Locale> get supportedLocales =>
      const [Locale(Keys.en), Locale(Keys.ar)];

  static Locale get fallbackLocale => const Locale(Keys.en);

  static Locale get locale => Locale(Get.find<NewAppAppPreferences>().getLang);
}

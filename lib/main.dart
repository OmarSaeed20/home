import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home/core/languages/ar_translations.dart';
import '/new_app/new_app_sl.dart';
import '/new_app/routes/app_pages.dart'; 

import '/core/util/keys.dart';
import '/core/util/theme.dart'; 
import 'new_app/app_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await newAppInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: ScreenUtilInit(
        designSize: MediaQuery.sizeOf(context),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        ensureScreenSize: true,
        builder: (context, child) => GetMaterialApp(
          title: "Home",
          debugShowCheckedModeBanner: false,
          translationsKeys: const {Keys.ar: ar, Keys.en: en},
          locale: Locale(Get.find<NewAppAppPreferences>().getLang),
          fallbackLocale: const Locale(Keys.en),
          supportedLocales: const [Locale(Keys.en), Locale(Keys.ar)],
          localizationsDelegates: const [
            // CountryLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: getThemeData,
          themeMode: ThemeMode.light,
          initialRoute: NewAppRoutes.init,
          getPages: NewAppAppPages.routes,
          // home: const Home(),
        ),
      ),
    );
  }
}


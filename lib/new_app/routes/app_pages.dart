import 'package:get/get.dart';
import 'package:home/new_app/presentation/main/search_service.dart';
import '/new_app/presentation/about_us/bindings/about_us_binding.dart';
import '/new_app/presentation/about_us/views/about_us_view.dart';
import '/new_app/presentation/about_us/views/privacy/privacy_view.dart';
import '/new_app/presentation/about_us/views/terms/terms_view.dart';
import '/new_app/presentation/choose_langeuage/bindings/choose_language_binding.dart';
import '/new_app/presentation/choose_langeuage/views/choose_language_view.dart';
import '/new_app/presentation/main/bindings/new_app_main_binding.dart';
import '/new_app/presentation/main/new_app_main_view.dart';
import '/new_app/presentation/service_details/service_deatails_view.dart';
import '/new_app/presentation/splash/bindings/splash_binding.dart';
import '/new_app/presentation/splash/views/splash_view.dart';

part 'app_routes.dart';

class NewAppAppPages {
  NewAppAppPages._();

  static final routes = <GetPage>[
    GetPage(
      name: NewAppRoutes.init,
      page: () => const NewAppSplashView(),
      binding: NewAppSplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NewAppRoutes.searchService,
      page: () => const SearchServiceView(),
      binding: NewAppMainBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NewAppRoutes.lang,
      page: () => const NewAppChooseLanguageView(),
      bindings: [NewAppChooseLanguageBinding()],
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NewAppRoutes.main,
      page: () => const NewAppMainView(),
      bindings: [NewAppChooseLanguageBinding(), NewAppMainBinding()],
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NewAppRoutes.serviceDetails,
      page: () => const ServiceDetailsView(),
      // bindings: [NewAppSplashBinding()],
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NewAppRoutes.aboutUs,
      page: () => const NewAppAboutUsView(),
      binding: NewAppAboutUsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NewAppRoutes.privacy,
      page: () => const NewAppPrivacyView(),
      binding: NewAppAboutUsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NewAppRoutes.terms,
      page: () => const NewAppTermsView(),
      binding: NewAppAboutUsBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}

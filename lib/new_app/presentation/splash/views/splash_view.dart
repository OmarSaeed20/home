import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/core/consts/app_colors.dart';
import '/core/consts/app_images.dart';
import '/core/consts/app_strings.dart';
import '/core/util/animation/widgets/fade_transition.dart';
import '/core/widget/app_text/text_styles.dart';
import '/core/widget/button/btn_widget.dart';
import '/core/widget/image_widget.dart';
import '/new_app/data/extensions.dart';
import '/new_app/new_app_service.dart';
import '/new_app/presentation/splash/controllers/splash_controller.dart';
import '/new_app/routes/app_pages.dart';
import '/core/widget/app_text/text_widget.dart';

class NewAppSplashView extends StatelessWidget {
  const NewAppSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewAppSplashControllerImp>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: CustomFadeIn(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: 20.padHorizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      30.sH,
                      Hero(
                        tag: "_logo_",
                        child: ImageWidget(
                          path: Kimage.homeLogoPng,
                          // path: NewAppService.to.newAppData.value?.logo,
                          width: 300,
                          height: 300,
                          loadingBuilder: (context) => const SizedBox.shrink(),
                        ),
                      ),
                      24.sH,
                      TextWidget(
                        NewAppService.to.newAppData.value?.siteNameAr
                            .translateDatabase(
                          NewAppService.to.newAppData.value?.siteNameEn,
                        ), // 'We deliver\ngrocery at your\n doorstep',
                        style: HomeTxStyle.gStyle24
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        // padding: (context.width / 4.4).padHorizontal,
                      ),
                      24.sH,
                      TextWidget(
                        NewAppService.to.newAppData.value?.aboutAr
                            .translateDatabase(
                          NewAppService.to.newAppData.value?.aboutEn,
                        ),
                        // 'Grocer gives you fresh vegetables and fruits.\n Order fresh items from grocer.',
                        style: HomeTxStyle.gStyle16,
                        textAlign: TextAlign.center,
                      ),
                      40.sH,
                      Center(
                        child: BtnWidget(
                          onTap: () {
                            Get.offNamed(NewAppRoutes.main);
                          },
                          title: KStrings.getStarted.tr,
                          bGColor: KColors.cirBlueBgDeep,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/* class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({super.key});

  @override
  State<MyCustomWidget> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Suppose this is an app in your Phone\'s Screen page.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            OpenContainer(
              closedBuilder: (_, openContainer) {
                return const SizedBox(
                  height: 80,
                  width: 80,
                  child: Center(
                    child: Text(
                      'App Logo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
              openColor: Colors.white,
              closedElevation: 20,
              closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              transitionDuration: const Duration(milliseconds: 700),
              openBuilder: (_, closeContainer) {
                return const SecondPage();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });
    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _b = true;
      });
    });
    Timer(const Duration(milliseconds: 1300), () {
      setState(() {
        _c = true;
      });
    });
    Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(const Duration(milliseconds: 3400), () {
      setState(() {
        _d = true;
      });
    });
    Timer(const Duration(milliseconds: 3850), () {
      setState(() {
        Navigator.of(context).pushReplacement(
          ThisIsFadeRoute(
            route: const ThirdPage(),
            page: const ThirdPage(),
          ),
        );
      });
    });
  }

  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                      ? h / 2
                      : 20,
              width: 20,
              // color: Colors.deepPurpleAccent,
            ),
            AnimatedContainer(
              duration: Duration(
                  seconds: _d
                      ? 1
                      : _c
                          ? 2
                          : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? h
                  : _c
                      ? 80
                      : 20,
              width: _d
                  ? w
                  : _c
                      ? 200
                      : 20,
              decoration: BoxDecoration(
                  color: _b ? Colors.white : Colors.transparent,
                  // shape: _c? BoxShape.rectangle : BoxShape.circle,
                  borderRadius: _d
                      ? const BorderRadius.only()
                      : BorderRadius.circular(30)),
              child: Center(
                child: _e
                    ? AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          FadeAnimatedText(
                            'APP NAME',
                            duration: const Duration(milliseconds: 1700),
                            textStyle: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThisIsFadeRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  ThisIsFadeRoute({required this.page, required this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(opacity: animation, child: route),
        );
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Back'),
        centerTitle: true,
        // brightness: Brightness.dark,
        backgroundColor: Colors.black,
      ),
    );
  }
}
 */
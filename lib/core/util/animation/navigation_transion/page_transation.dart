import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '/core/util/animation/widgets/fade_transition.dart';

class PageTransition extends GetPageRoute {
  // final Widget page;

  PageTransition({required Widget page})
      : super(
          page: () => FadeTransitionWidget(child: page),
          transition: Transition.downToUp,
          transitionDuration: const Duration(milliseconds: 2000),
        );

  /* @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return page;
  } */

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    animation = CurvedAnimation(
      curve: Curves.fastLinearToSlowEaseIn,
      parent: animation,
    );
    return CupertinoPageTransition(
      primaryRouteAnimation: animation,
      secondaryRouteAnimation: secondaryAnimation,
      linearTransition: true,
      child: child,
    );
    /* 
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animation,
          curve: Curves.fastLinearToSlowEaseIn,
        ),
        axisAlignment: 0,
        child: child,
      ),
    ); */
  }
}

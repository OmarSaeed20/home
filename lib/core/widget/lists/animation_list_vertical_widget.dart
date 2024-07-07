import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationListWidget extends StatelessWidget {
  const AnimationListWidget({
    super.key,
    required this.child,
    required this.index,
    this.vertical,
    this.horizontal,
    this.curve = Curves.ease,
    this.milliseconds = 500,
  });
  final int index;
  final Widget child;
  final double? vertical;
  final double? horizontal;
  final int milliseconds;
  final Curve curve;
  @override
  Widget build(BuildContext context) => AnimationConfiguration.staggeredList(
        position: index,
        duration: Duration(milliseconds: milliseconds),
        child: SlideAnimation(
          curve: curve,
          horizontalOffset: horizontal,
          verticalOffset: vertical,
          child: FadeInAnimation(child: child),
        ),
      );
}

class AnimatedViewWidget extends StatelessWidget {
  const AnimatedViewWidget({
    super.key,
    required this.child,
    required this.index,
    this.curve = Curves.ease,
    this.milliseconds = 500,
  });
  final int index;
  final Widget child;
  final int milliseconds;
  final Curve curve;
  @override
  Widget build(BuildContext context) => AnimationListWidget(
        curve: Curves.fastOutSlowIn,
        // curve: Curves.fastLinearToSlowEaseIn,
        vertical: context.height * 0.15,
        horizontal: 300,
        index: 0,
        milliseconds: 300 + (0 * 200),
        child: child,
      ).animate().fadeIn();
}

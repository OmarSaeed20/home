import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../onboarding_animation.dart';

class FadeTransitionWidget extends StatefulWidget {
  final bool playAnimation;
  final Widget child;
  const FadeTransitionWidget(
      {this.playAnimation = true, super.key, required this.child});

  @override
  State<FadeTransitionWidget> createState() => _FadeTransitionWidgetState();
}

class _FadeTransitionWidgetState extends State<FadeTransitionWidget>
    with TickerProviderStateMixin {
  late AnimationController _slideAnimationController;
  late Animation<double> _slideAnimation;

  Animation<double> get slideAnimation => _slideAnimation;
  AnimationController get slideAnimationController => _slideAnimationController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.playAnimation) {
      _slideAnimationController.forward();
    } else {
      _slideAnimationController.animateTo(
        1,
        duration: const Duration(milliseconds: 0),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _slideAnimationController =
        OnboardingAnimations.createSlideController(this);
    _slideAnimation =
        OnboardingAnimations.fadeAnimation(_slideAnimationController);
  }

  @override
  void dispose() {
    _slideAnimationController.dispose();
    super.dispose();
  }

  @override
  // Widget build(BuildContext context) => SlideTransition(
  //       position: _slideAnimation,
  Widget build(BuildContext context) =>
      /* CupertinoPageTransition(
        primaryRouteAnimation: primaryRouteAnimation,
        secondaryRouteAnimation: secondaryRouteAnimation,
        child: child,
        linearTransition: linearTransition,
      ); */
      FadeTransition(opacity: _slideAnimation, child: widget.child);
}

class CustomFadeIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;

  const CustomFadeIn({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delay = const Duration(milliseconds: 0),
    this.curve = Curves.easeIn,
  });

  @override
  State<CustomFadeIn> createState() => _CustomFadeInState();
}

class _CustomFadeInState extends State<CustomFadeIn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}

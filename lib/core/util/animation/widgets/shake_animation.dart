import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShakeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static ShakeController get to => Get.find<ShakeController>();
  late final AnimationController animationController;
  ShakeController(Duration animationDuration) {
    animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );
    animationController.addStatusListener(_animationControllerListener);
  }

  _animationControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) animationController.reset();
  }

  void shake() {
    animationController.forward();
  }

  @override
  void onClose() {
    animationController.removeStatusListener(_animationControllerListener);
    animationController.dispose();
    super.onClose();
  }
}

class ShakeWidget extends StatelessWidget {
  final Widget child;
  final double shakeOffset;
  final int shakeCount;
  final Duration shakeDuration;

  const ShakeWidget({
    required this.child,
    required this.shakeOffset,
    this.shakeCount = 3,
    this.shakeDuration = const Duration(milliseconds: 400),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize the ShakeController with the provided shakeDuration
    final ShakeController shakeController =
        Get.put(ShakeController(shakeDuration));

    return AnimatedBuilder(
      animation: shakeController.animationController,
      child: child,
      builder: (context, child) {
        final sineValue = sin(
            shakeCount * 2 * pi * shakeController.animationController.value);
        return Transform.translate(
          offset: Offset(sineValue * shakeOffset, 0),
          child: child,
        );
      },
    );
  }
}

/* abstract class ShakeAnimation<T extends StatefulWidget> extends State<T>
    with SingleTickerProviderStateMixin {
  ShakeAnimation(this.animationDuration);
  final Duration animationDuration;
  late final animationController =
      AnimationController(vsync: this, duration: animationDuration);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    required this.child,
    required this.shakeOffset,
    super.key,
    this.shakeCount = 3,
    this.shakeDuration = const Duration(milliseconds: 400),
  });
  final Widget child;
  final double shakeOffset;
  final int shakeCount;
  final Duration shakeDuration;

  @override
  // ignore: no_logic_in_create_state
  ShakeWidgetState createState() => ShakeWidgetState(shakeDuration);
}

class ShakeWidgetState extends ShakeAnimation<ShakeWidget> {
  ShakeWidgetState(super.duration);

  @override
  void initState() {
    super.initState();
    animationController.addStatusListener(_updateStatus);
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) animationController.reset();
  }

  void shake() => animationController.forward();

  @override
  void dispose() {
    animationController.removeStatusListener(_updateStatus);
    animationController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: animationController,
        child: widget.child,
        builder: (context, child) {
          final sineValue =
              sin(widget.shakeCount * 2 * pi * animationController.value);
          return Transform.translate(
            offset: Offset(sineValue * widget.shakeOffset, 0),
            child: child,
          );
        },
      );
}
 */


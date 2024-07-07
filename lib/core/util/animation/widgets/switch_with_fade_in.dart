import 'package:flutter/material.dart';

class SwitchWithFadeIn extends StatelessWidget {
  final Widget firstWidget, secondWidget;
  final bool showFirstWidget;

  const SwitchWithFadeIn({
    super.key,
    required this.firstWidget,
    required this.secondWidget,
    required this.showFirstWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: showFirstWidget ? firstWidget : secondWidget,
    );
  }
}

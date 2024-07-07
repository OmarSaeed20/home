import 'package:flutter/material.dart';

class PopupMenuButtonWidget<T> extends StatelessWidget {
  const PopupMenuButtonWidget({
    super.key,
    required this.child,
    required this.itemBuilder,
    this.onSelected,
  });
  final Widget child;
  final List<PopupMenuEntry<T>> Function(BuildContext) itemBuilder;
  final void Function(int)? onSelected;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      onSelected: (i) => onSelected,
      itemBuilder: itemBuilder,
      child: child,
    );
  }
}

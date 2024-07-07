import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  double height;
   SliverDelegate({required this.child, this.height = 70});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) =>
      oldDelegate.maxExtent != height ||
      oldDelegate.minExtent != height ||
      child != oldDelegate.child;
}

class SliverPerHeadDelegate implements SliverPersistentHeaderDelegate {
  final double minHeight, maxHeight;
  final Widget child;

  SliverPerHeadDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext cxt, double shrinkOffset, bool overlapsContent) =>
      SizedBox.expand(child: child);
  @override
  bool shouldRebuild(SliverPerHeadDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxHeight ||
      oldDelegate.minExtent != minHeight ||
      child != oldDelegate.child;
/*   
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true; */

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  TickerProvider? get vsync => null;
}

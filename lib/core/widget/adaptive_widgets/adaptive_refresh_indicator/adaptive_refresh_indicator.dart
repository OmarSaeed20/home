import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveRefreshIdicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const AdaptiveRefreshIdicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return _IOSAdaptiveRefreshIdicator(onRefresh: onRefresh, child: child);
    }
    return _AndroidAdaptiveRefreshIdicator(onRefresh: onRefresh, child: child);
  }
}

class _AndroidAdaptiveRefreshIdicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const _AndroidAdaptiveRefreshIdicator({
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: child,
    );
  }
}

class _IOSAdaptiveRefreshIdicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const _IOSAdaptiveRefreshIdicator({
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        CupertinoSliverRefreshControl(onRefresh: onRefresh),
        SliverToBoxAdapter(child: child)
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/core/consts/app_constants.dart';

class AdaptiveRefreshIdicator2 extends StatelessWidget {
  final Widget? body, tabBarBody;
  final List<Widget>? slivers;
  final List<Widget>? headerSliverBuilder;
  final ScrollController? controller;
  final Future<void> Function() onRefresh;

  const AdaptiveRefreshIdicator2({
    super.key,
    this.body,
    this.tabBarBody,
    this.slivers,
    this.headerSliverBuilder,
    this.controller,
    required this.onRefresh,
  }) : assert(((slivers != null) != (body != null)) ||
            (headerSliverBuilder != null));

  @override
  Widget build(BuildContext context) {
    return _SliverAdaptiveRefreshIdicator(
      onRefresh: onRefresh,
      scrCtrl: controller,
      slivers: slivers,
      headerSliverBuilder: headerSliverBuilder,
      tabBarBody: tabBarBody,
      child: body,
    );
  }
}

class _SliverAdaptiveRefreshIdicator extends StatelessWidget {
  final Widget? child, tabBarBody;
  final Future<void> Function() onRefresh;
  final List<Widget>? slivers;
  final List<Widget>? headerSliverBuilder;
  final ScrollController? scrCtrl;
  const _SliverAdaptiveRefreshIdicator({
    this.slivers,
    this.headerSliverBuilder,
    this.child,
    this.tabBarBody,
    required this.onRefresh,
    this.scrCtrl,
  });

  @override
  Widget build(BuildContext context) {
    if (AppConstants.isIos) {
      return _IosView(
        onRefresh: onRefresh,
        slivers: slivers,
        scrCtrl: scrCtrl,
        headerSliverBuilder: headerSliverBuilder,
        tabBarBody: tabBarBody,
        child: child,
      );
    } else {
      return _AndroidView(
        headerSliverBuilder: headerSliverBuilder,
        scrCtrl: scrCtrl,
        onRefresh: onRefresh,
        slivers: slivers,
        tabBarBody: tabBarBody,
        child: child,
      );
    }
  }
}

class _AndroidView extends StatelessWidget {
  const _AndroidView({
    required this.headerSliverBuilder,
    required this.scrCtrl,
    required this.onRefresh,
    required this.slivers,
    required this.child,
    required this.tabBarBody,
  });

  final List<Widget>? headerSliverBuilder;
  final ScrollController? scrCtrl;
  final Future<void> Function() onRefresh;
  final List<Widget>? slivers;
  final Widget? child, tabBarBody;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, _) => [
        ...(headerSliverBuilder ?? <Widget>[]),
      ],
      controller: scrCtrl,
      body: RefreshIndicator(
        onRefresh: () async => await onRefresh.call(),
        child: CustomScrollView(
          slivers: [
            if (tabBarBody != null)
              SliverFillViewport(
                delegate: SliverChildListDelegate([
                  tabBarBody ?? const SizedBox.shrink(),
                ]),
              )
            else ...[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ...(slivers ?? <Widget>[]),
                  ],
                ),
              ),
              if (child != null)
                SliverToBoxAdapter(child: child ?? const SizedBox.shrink()),
            ],
          ],
        ),
      ),
    );
  }
}

class _IosView extends StatelessWidget {
  const _IosView({
    this.child,
    this.tabBarBody,
    required this.onRefresh,
    this.slivers,
    this.headerSliverBuilder,
    this.scrCtrl,
  });
  final Widget? child, tabBarBody;
  final Future<void> Function() onRefresh;
  final List<Widget>? slivers;
  final List<Widget>? headerSliverBuilder;
  final ScrollController? scrCtrl;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: <Widget>[
        ...(headerSliverBuilder ?? <Widget>[]),
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            await onRefresh.call();
          },
        ),
        if (tabBarBody != null)
          SliverToBoxAdapter(child: tabBarBody ?? const SizedBox.shrink())
        else ...[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ...(slivers ?? <Widget>[]),
              ],
            ),
          ),
          if (child != null)
            SliverToBoxAdapter(
              child: child ?? const SizedBox.shrink(),
            ),
        ]
      ],
    );
  }
}

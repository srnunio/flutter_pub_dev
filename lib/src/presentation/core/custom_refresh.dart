
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'base_widget.dart';
import 'custom_progress.dart';

class CustomRefresh extends BaseComponent {
  final bool enablePullDown;
  final bool enablePullUp;
  final RefreshController refresh;
  final VoidCallback onRefresh;
  final VoidCallback onLoading;
  final Widget child;

  CustomRefresh(
      {this.enablePullDown = true,
      this.enablePullUp = true,
      @required this.refresh,
      this.onRefresh,
      this.onLoading,
      @required this.child});

  @override
  Widget build(BuildContext context) {

    return SmartRefresher(
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      physics: ClampingScrollPhysics(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.loading) {
            body = Container(
              child: CustomProgress(),
              width: 24,
              height: 24,
            );
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: refresh,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: child,
    );
  }
}

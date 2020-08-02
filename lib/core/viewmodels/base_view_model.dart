import 'package:flutter/material.dart';
import 'package:flutter_package/core/utils/utils.dart';
import 'package:flutter_package/model/domain/package.dart';
import 'package:mobx/mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

part 'base_view_model.g.dart';


abstract class BaseModel = _BaseModel with _$BaseModel;

abstract class _BaseModel with Store {
  _BaseModel();
  @observable
  bool _isBusy = false;

  @computed
  bool get isBusy => _isBusy;

  @action
  void setBusy(bool state) {
    _isBusy = state;
  }

  void loadState( {bool value = false}){
    if (value) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _refreshIndicatorKey.requestRefresh());
    } else {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => _refreshIndicatorKey.refreshCompleted(resetFooterState: true));

      WidgetsBinding.instance
          .addPostFrameCallback((_) => _refreshIndicatorKey.loadComplete());
    }
  }

  RefreshController get refresh => _refreshIndicatorKey;

  final RefreshController _refreshIndicatorKey = new RefreshController(
    initialRefresh: false,
  );

  onDownload({String url}) async {
    try {
      if (await canLaunch(url)) {
        await launch(
          url,
          forceSafariVC: false,
          forceWebView: false,
        );
      }
    }catch(ex){
    }
  }

  openGithub({String url}) async {
    try {
      if (await canLaunch(url)) {
        await launch(
          url,
          forceSafariVC: false,
          forceWebView: false,
        );
      }
    }catch(ex){
    }
  }

  shareProject({BuildContext context, Package package}) {
    var url = package.latest.archive_url.replaceAll('/versions/${package.latest.version}.tar.gz', '');
    Share.share(url);
  }
}

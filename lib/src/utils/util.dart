import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l18n.dart';

class Util {
  /// [defaultLocale] get locale to device
  static Future<Locale> defaultLocale() async {
    var value = Platform.localeName;
    value = (value.isEmpty) ? 'pt' : value;
    value = value.toLowerCase().contains('pt') ? 'pt' : 'en';
    return I18n.filterLocale(Locale(value));
  }

  /// [openLink] open an address on the web
  static openLink({required String url}) async {
    try {
      if (await canLaunch(url)) {
        await launch(
          url,
          forceSafariVC: false,
          forceWebView: false,
        );
      }
    } catch (ex) {}
  }

  /// [shareProject] share the package address
  static shareProject({required Package package}) {
    var url = package.latest.archiveUrl
        .replaceAll('/versions/${package.latest.version}.tar.gz', '');
    Share.share(url);
  }
}

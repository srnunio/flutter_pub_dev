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
    while (Platform.localeName == null) {
      await Future.delayed(const Duration(microseconds: 300), () {});
    }
    var value = Platform.localeName;
    value = (value == null || value.isEmpty) ? 'pt' : value;
    value = value.toLowerCase().contains('pt') ? 'pt' : 'en';
    return I18n.filterLocale(Locale(value));
  }

  /// print message [logs]
  static logs(String message) {
    debugPrint('${message}');
  }

  /// [parseColor] parsed string to color
  static Color parseColor(String hexCode) {
    String hex = hexCode.replaceAll("#", "");
    if (hex.isEmpty) hex = "ffffff";
    if (hex.length == 3) {
      hex =
          '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
    }
    Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
    return col;
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
    var url = package.latest.archive_url
        .replaceAll('/versions/${package.latest.version}.tar.gz', '');
    Share.share(url);
  }
}

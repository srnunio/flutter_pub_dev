import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart';

import 'Translations.dart';

class Utils {
  static logs(String log) {
    debugPrint('Log: ${log}');
  }

  static void messageToast({String message, bool reference = false, ToastGravity possition = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
        msg: reference ? Translations.current.text('${message}') : message,
        backgroundColor: Colors.black.withOpacity(0.7),
        toastLength: Toast.LENGTH_LONG,
        gravity: possition,
        timeInSecForIos: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Future<bool> isConection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

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

  static Future<Locale> defaultLocale() async {
    while (Platform.localeName == null) {
      await Future.delayed(const Duration(microseconds: 300), () {});
    }
    var value = Platform.localeName;
    value = (value == null || value.isEmpty) ? 'pt' : value;
    value = value.toLowerCase().contains('pt') ? 'pt' : 'pt';
    return Translations.filterLocale(Locale(value));
  }
}

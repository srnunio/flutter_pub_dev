import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomProgress extends StatelessWidget {
  const CustomProgress();

  @override
  Widget build(BuildContext context) => Platform.isAndroid
      ? const CircularProgressIndicator(strokeWidth: 2.0)
      : const MediaQuery(
          data: MediaQueryData(platformBrightness: Brightness.dark),
          child: CupertinoActivityIndicator());
}

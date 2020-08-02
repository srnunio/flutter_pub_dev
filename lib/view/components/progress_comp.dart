import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class ProgressComp extends StatelessWidget{
  Color color;

  ProgressComp({this.color});

  @override
  Widget build(BuildContext context) {
    color = color == null ? Styles.progress : color;
    return Center(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Platform.isIOS
            ? CupertinoActivityIndicator()
            : CircularProgressIndicator(
            strokeWidth: 0.5,
            valueColor: AlwaysStoppedAnimation<Color>(color)),
      ),
    );
  }

}
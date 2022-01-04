import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/presentation/core/base_widget.dart';
import 'package:flutter_package/src/utils/colors.dart';
import 'package:flutter_package/src/presentation/core/styles.dart';
import 'package:flutter_package/src/utils/size.dart';

class Tag extends BaseComponent {
  Tag({required String value}) : super(value: value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      constraints: BoxConstraints(minWidth: 40.0),
      decoration: decoration(
          color: kPrimaryColor, borderRadius: kBorder),
      child: Center(
        child: Text(
          value!,
          style: styleText(
            fontSize: 12.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

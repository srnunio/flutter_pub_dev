import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/domain/packages/entities/version.dart';
import 'package:flutter_package/src/utils/colors.dart';
import 'package:flutter_package/src/presentation/core/styles.dart';

class VersionItem extends StatelessWidget {
  final Version version;
  final bool selected;
  final Function() onTap;

  VersionItem(
      {required this.version, required this.onTap, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Chip(
        padding: EdgeInsets.zero,
        backgroundColor: selected ? kPrimaryColor : kPlaceholderColor,
        label: InkWell(
          onTap: onTap,
          child: Container(
            constraints: BoxConstraints(maxWidth: 100.0),
            child: Center(
              child: Text(
                version.version,
                style: styleText(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}

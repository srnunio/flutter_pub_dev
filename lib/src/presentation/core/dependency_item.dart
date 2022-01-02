import 'package:flutter/material.dart';
import 'package:flutter_package/src/domain/packages/entities/dependency.dart';
import 'package:flutter_package/src/utils/colors.dart';
import 'package:flutter_package/src/utils/size.dart';

import 'base_widget.dart';
import 'styles.dart';

/// [DependencyItem] dependency visualization model
class DependencyItem extends BaseComponent {
  final Dependency dependency;
  final Function(String) openDependency;

  DependencyItem({required this.dependency, required this.openDependency});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 4.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: InkWell(
          onTap: () => openDependency(dependency.name.trim()),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  dependency.name.trim(),
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: styleText(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      decoration: TextDecoration.underline).copyWith(
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 2,

                  ),
                ),
                Text(
                  ':',
                  textAlign: TextAlign.center,
                  style: styleText(
                      fontWeight: FontWeight.bold, color: kPrimaryColor),
                ),
                horizontalSpaceSmall(),
                Text(
                  dependency.version,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: styleText(color: kSubtitleTextColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

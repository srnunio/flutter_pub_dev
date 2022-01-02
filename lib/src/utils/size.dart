import 'package:flutter/material.dart';

const double _VerticalSpaceSmall = 10.0;
const double _VerticalSpaceMedium = 20.0;
const double _VerticalSpaceLarge = 60.0;

const double _HorizontalSpaceSmall = 10.0;
const double _HorizontalSpaceMedium = 20.0;
const double HorizontalSpaceLarge = 60.0;

const double kIconSize = 20.0;

const double kTitleSize = 16.0;

const double kSubtitleSize = 14.0;

const double kBorder = 8.0;

Widget verticalSpaceSmall() {
  return verticalSpace(_VerticalSpaceSmall);
}

Widget verticalSpaceMedium() {
  return verticalSpace(_VerticalSpaceMedium);
}

Widget verticalSpaceLarge() {
  return verticalSpace(_VerticalSpaceLarge);
}

Widget verticalSpace(double height) {
  return Container(height: height);
}

Widget horizontalSpaceSmall() {
  return horizontalSpace(_HorizontalSpaceSmall);
}

Widget horizontalSpaceMedium() {
  return horizontalSpace(_HorizontalSpaceMedium);
}

Widget horizontalSpaceLarge() {
  return horizontalSpace(HorizontalSpaceLarge);
}

Widget horizontalSpace(double width) {
  return Container(width: width);
}

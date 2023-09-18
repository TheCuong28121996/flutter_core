import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetExt on Widget {
  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal.w,
        vertical: vertical.h,
      ),
      child: this,
    );
  }

  Widget all(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: value.w,
        vertical: value.h,
      ),
      child: this,
    );
  }

  Widget paddingOnly(
      {double left = 0.0,
      double right = 0.0,
      double top = 0.0,
      double bottom = 0.0}) {
    return Padding(
      padding: EdgeInsets.only(
        left: left.w,
        right: right.w,
        top: top.h,
        bottom: bottom.h,
      ),
      child: this,
    );
  }
}

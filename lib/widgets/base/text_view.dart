import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextView extends StatelessWidget {
  const TextView(
      this.data, {
        Key? key,
        this.color,
        this.fontWeight,
        this.maxLines,
        this.overflow,
        this.textAlign,
        this.fontSize,
        this.top,
        this.bottom,
        this.left,
        this.right,
        this.horizontal,
        this.vertical,
        this.decoration,
      }) : super(key: key);

  final String data;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final double? fontSize;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double? horizontal;
  final double? vertical;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    final effectiveTop = vertical?.h ?? top?.h ?? 0;
    final effectiveBottom = vertical?.h ?? bottom?.h ?? 0;
    final effectiveLeft = horizontal?.w ?? left?.w ?? 0;
    final effectiveRight = horizontal?.w ?? right?.w ?? 0;

    final textStyle = TextStyle(
      fontSize: fontSize?.sp ?? 14.sp,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w400,
      decoration: decoration,
    );

    final content = Text(
      data,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: textStyle,
    );

    if (effectiveTop == 0 &&
        effectiveBottom == 0 &&
        effectiveLeft == 0 &&
        effectiveRight == 0) {
      return content;
    }

    return Padding(
      padding: EdgeInsets.only(
        top: effectiveTop,
        bottom: effectiveBottom,
        left: effectiveLeft,
        right: effectiveRight,
      ),
      child: content,
    );
  }
}

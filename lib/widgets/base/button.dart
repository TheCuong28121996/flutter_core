import 'package:base_project/res/res.dart';
import 'package:base_project/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.title,
    this.fontSize,
    this.colorText = Colors.white,
    this.backgroundColor = AppColor.colorPrimary,
    this.borderColor = AppColor.colorPrimary,
    this.radius = 8,
    this.disabled = false,
    this.onPressed,
    this.height,
    this.width,
    this.vertical = 0,
    this.horizontal = 0,
    this.top,
    this.bottom,
    this.left,
    this.right,
  }) : super(key: key);

  final String title;
  final double? fontSize;
  final Color colorText;
  final Color backgroundColor;
  final Color borderColor;
  final double radius;
  final bool disabled;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final double vertical;
  final double horizontal;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        left?.w ?? horizontal.w,
        top?.h ?? vertical.h,
        right?.w ?? horizontal.w,
        bottom?.h ?? vertical.h,
      ),
      child: ElevatedButton(
        onPressed: () {
          if (!disabled) {
            onPressed?.call();
          }
        },
        style: ElevatedButton.styleFrom(
          minimumSize: (height != null || width != null)
              ? Size(width ?? 1.sw, height ?? 40.h)
              : null,
          backgroundColor: disabled ? const Color(0xFFCFCAC6) : backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.r),
            side: disabled ? BorderSide.none : BorderSide(color: borderColor),
          ),
        ),
        child: TextView(
          title.toUpperCase(),
          fontSize: fontSize,
          color: disabled ? Colors.white : colorText,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

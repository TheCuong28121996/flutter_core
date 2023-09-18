import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({super.key, this.child, this.children});

  final List<Widget>? children;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: child ??
            Column(mainAxisSize: MainAxisSize.min, children: children!),
      ),
    );
  }
}

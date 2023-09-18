import 'package:base_project/res/res.dart';
import 'package:base_project/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.content,
    required this.onSubmit,
    this.titleSubmit,
    this.onCancel,
    this.titleCancel,
  });

  final String content;
  final VoidCallback onSubmit;
  final VoidCallback? onCancel;
  final String? titleSubmit;
  final String? titleCancel;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      children: [
        const TextView(Strings.notification,
            fontSize: 20, bottom: 16, fontWeight: FontWeight.bold),
        TextView(content,
            textAlign: TextAlign.center, fontSize: 16, bottom: 20),
        Row(
          children: [
            Expanded(
              child: Button(
                title: titleCancel ?? Strings.close,
                onPressed: () {
                  Navigator.pop(context);
                  onCancel?.call();
                },
                backgroundColor: Colors.white,
                colorText: AppColor.colorPrimary,
                borderColor: AppColor.colorPrimary,
                right: 6.w,
              ),
            ),
            Expanded(
              child: Button(
                title: titleSubmit ?? Strings.confirm,
                colorText: Colors.white,
                backgroundColor: AppColor.colorPrimary,
                onPressed: () {
                  Navigator.pop(context);
                  onSubmit();
                },
                left: 6.w,
              ),
            ),
          ],
        )
      ],
    );
  }
}

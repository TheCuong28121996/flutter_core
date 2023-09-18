import 'package:base_project/res/res.dart';
import 'package:base_project/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogSingleBtn extends StatelessWidget {
  const DialogSingleBtn({
    super.key,
    required this.content,
    required this.onSubmit,
    this.titleSubmit,
    required this.barrierDismissible,
  });

  final String content;
  final String? titleSubmit;
  final VoidCallback onSubmit;
  final bool barrierDismissible;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      children: [
        const TextView(Strings.notification,
            fontSize: 20, bottom: 16, fontWeight: FontWeight.bold),
        TextView(content,
            textAlign: TextAlign.center, fontSize: 16, bottom: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Button(
            title: titleSubmit ?? Strings.ok,
            colorText: Colors.white,
            backgroundColor: AppColor.colorPrimary,
            width: 1.sw,
            onPressed: () {
              if (barrierDismissible) {
                Navigator.pop(context);
              }
              onSubmit.call();
            },
          ),
        ),
      ],
    );
  }
}

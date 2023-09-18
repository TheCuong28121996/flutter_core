import 'package:base_project/res/res.dart';
import 'package:base_project/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:base_project/common/commons.dart';

import 'ui_repository.dart';

class UIRepositoryImpl extends UIRepository {
  late final OverlayEntry _overlay;

  UIRepositoryImpl() {
    _overlay = OverlayEntry(
      builder: (context) {
        return Center(
          child: SizedBox(
              width: 64, height: 64, child: Lottie.asset(AssetPath.loading)),
        );
      },
    );
  }

  @override
  void showLoading(BuildContext context, bool isShow) {
    if (isShow) {
      Overlay.of(context).insert(_overlay);
    } else {
      _overlay.remove();
    }
  }

  @override
  void showErrorMsg(BuildContext context, String? msg) {
    if (msg.isNullOrEmpty) {
      return;
    }

    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.white),
          TextView(msg!, color: Colors.white, left: 8),
        ],
      ),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void showMsg(BuildContext context, String? msg) {
    if (msg.isNullOrEmpty) {
      return;
    }

    final snackBar = SnackBar(content: TextView(msg!, color: Colors.white));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void showDlg(BuildContext context, List<Widget>? children, Widget? child,
      bool barrierDismissible) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        return BaseDialog(children: children, child: child);
      },
    );
  }

  @override
  void showConfirmDialog(
      BuildContext context,
      String content,
      VoidCallback onSubmit,
      bool barrierDismissible,
      VoidCallback? onCancel,
      String? titleSubmit,
      String? titleCancel) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        return ConfirmDialog(
          content: content,
          titleSubmit: titleSubmit,
          titleCancel: titleCancel,
          onSubmit: onSubmit,
          onCancel: onCancel,
        );
      },
    );
  }

  @override
  void showSingleBtn(BuildContext context, String content,
      VoidCallback onSubmit, bool barrierDismissible, String? titleSubmit) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        return DialogSingleBtn(
          content: content,
          titleSubmit: titleSubmit,
          onSubmit: onSubmit,
          barrierDismissible: barrierDismissible,
        );
      },
    );
  }

  @override
  void showBtmSheet(BuildContext context, Widget? child, List<Widget>? children,
      BoxConstraints? boxConstraints, Function? onCallBack) {
    showModalBottomSheet(
      context: context,
      constraints: boxConstraints,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.r),
          topRight: Radius.circular(18.r),
        ),
      ),
      builder: (ctx) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
          child: child ??
              Column(mainAxisSize: MainAxisSize.min, children: children ?? []),
        );
      },
    ).then((value) {
      onCallBack?.call(value);
    });
  }
}

import 'package:flutter/material.dart';

abstract class UIRepository {
  void showLoading(BuildContext context, bool isShow);

  void showErrorMsg(BuildContext context, String? msg);

  void showMsg(BuildContext context, String? msg);

  void showDlg(BuildContext context, List<Widget>? children, Widget? child,
      bool barrierDismissible);

  void showConfirmDialog(
    BuildContext context,
    String content,
    VoidCallback onSubmit,
    bool barrierDismissible,
    VoidCallback? onCancel,
    String? titleSubmit,
    String? titleCancel,
  );

  void showSingleBtn(
    BuildContext context,
    String content,
    VoidCallback onSubmit,
    bool barrierDismissible,
    String? titleSubmit,
  );

  void showBtmSheet(
    BuildContext context,
    Widget? child,
    List<Widget>? children,
    BoxConstraints? boxConstraints,
    Function? onCallBack,
  );
}

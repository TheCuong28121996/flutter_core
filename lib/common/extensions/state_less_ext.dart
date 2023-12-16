import 'package:base_project/injection/injection.dart';
import 'package:flutter/material.dart';

import '../../repositories/repositories.dart';

extension StateLessExt on StatelessWidget {
  static final UIRepository _uiRepository = getIt<UIRepository>();

  // Show loading
  void showLoading(BuildContext context, bool isShow) {
    _uiRepository.showLoading(context, isShow);
  }

  // Show error
  void showErrorMsg(BuildContext context, String? msg) {
    _uiRepository.showErrorMsg(context, msg);
  }

  // Show Msg
  void showMsg(BuildContext context, String? msg) {
    _uiRepository.showMsg(context, msg);
  }

  // Show dialog custom
  void showDlg(
      {required BuildContext context,
      List<Widget>? children,
      Widget? child,
      bool barrierDismissible = true}) {
    _uiRepository.showDlg(context, children, child, barrierDismissible);
  }

  // Show dialog confirm
  void showConfirmDialog(
      {required BuildContext context,
      required String content,
      required VoidCallback onSubmit,
      VoidCallback? onCancel,
      bool barrierDismissible = true,
      String? titleSubmit,
      String? titleCancel}) {
    _uiRepository.showConfirmDialog(context, content, onSubmit,
        barrierDismissible, onCancel, titleSubmit, titleCancel);
  }

  // Show dialog single button
  void showDialogSingleBtn({
    required BuildContext context,
    required String content,
    required VoidCallback onSubmit,
    bool barrierDismissible = true,
    String? titleSubmit,
  }) {
    _uiRepository.showSingleBtn(
        context, content, onSubmit, barrierDismissible, titleSubmit);
  }

  // Show ModalBottomSheet
  void showBtmSheet({
    required BuildContext context,
    Widget? child,
    List<Widget>? children,
    BoxConstraints? boxConstraints,
    Function? onCallBack,
  }) {
    _uiRepository.showBtmSheet(
        context, child, children, boxConstraints, onCallBack);
  }
}

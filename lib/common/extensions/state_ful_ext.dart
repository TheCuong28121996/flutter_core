import 'package:base_project/injection/injection.dart';
import 'package:flutter/material.dart';

import '../../repositories/repositories.dart';

extension StateFulExt<T extends StatefulWidget> on State<T> {
  static final UIRepository _uiRepository = getIt<UIRepository>();

  // Show loading
  void showLoading(bool isShow) {
    _uiRepository.showLoading(context, isShow);
  }

  // Show error
  void showErrorMsg(String? msg) {
    _uiRepository.showErrorMsg(context, msg);
  }

  // Show Msg
  void showMsg(String? msg) {
    _uiRepository.showMsg(context, msg);
  }

  // Show dialog custom
  void showDlg(
      {List<Widget>? children, Widget? child, bool barrierDismissible = true}) {
    _uiRepository.showDlg(context, children, child, barrierDismissible);
  }

  // Show dialog confirm
  void showConfirmDialog(
      {required String content,
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
    Widget? child,
    List<Widget>? children,
    BoxConstraints? boxConstraints,
    Function? onCallBack,
  }) {
    _uiRepository.showBtmSheet(
        context, child, children, boxConstraints, onCallBack);
  }
}

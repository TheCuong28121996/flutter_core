import 'package:base_project/common/utils/ui/ui_repository.dart';
import 'package:base_project/injection/injection.dart';
import 'package:flutter/material.dart';

extension StateLessExt on StatelessWidget {
  static final UIRepository _uiRepository = getIt<UIRepository>();

  void showLoading(BuildContext context, bool isShow) {
    _uiRepository.showLoading(context, isShow);
  }

  void showErrorMsg(BuildContext context, String? msg) {
    _uiRepository.showErrorMsg(context, msg);
  }

  void showMsg(BuildContext context, String? msg) {
    _uiRepository.showMsg(context, msg);
  }

  void showDlg(
      {required BuildContext context,
      List<Widget>? children,
      Widget? child,
      bool barrierDismissible = true}) {
    _uiRepository.showDlg(context, children, child, barrierDismissible);
  }

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
}

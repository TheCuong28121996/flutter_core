import 'package:base_project/res/res.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

extension StateLessExt on StatelessWidget {
  static final OverlayEntry _overlay = OverlayEntry(
    builder: (context) {
      return Center(
        child: SizedBox(
          width: 64,
          height: 64,
          child: Lottie.asset(AssetPath.loading),
        ),
      );
    },
  );

  void showLoading(BuildContext context, bool isShow) {
    if (isShow) {
      Overlay.of(context).insert(_overlay);
    } else {
      _overlay.remove();
    }
  }
}

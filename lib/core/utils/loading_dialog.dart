import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showLoadingDialog(BuildContext context) {
  ThemeData theme = Theme.of(context);
  double dialogSize = 75.0;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        insetAnimationDuration: const Duration(milliseconds: 2000),
        insetAnimationCurve: Curves.elasticOut,
        backgroundColor: Colors.transparent,
        elevation: 2,
        child: Center(
          child: Container(
            width: dialogSize,
            height: dialogSize,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Lottie.asset(
              'assets/lottie/loading.json',
              width: dialogSize,
              height: dialogSize,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      );
    },
  );
}

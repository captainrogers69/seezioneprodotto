import 'dart:math';
import 'package:seezioneprodotto/config/packages/flushbar/flushbar.dart';
import 'package:seezioneprodotto/config/routers/nav_service.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/constants/k_styles.dart';
import 'package:flutter/material.dart';
import '../constants/container_util.dart';

enum ToastStyle { error, info }

Future<void> toasting(
    {required BuildContext context,
    ToastStyle? style = ToastStyle.info,
    required String message,
    String? title}) async {
  await Flushbar(
    // margin: const EdgeInsets.symmetric(horizontal: 5),
    borderRadius: witRadiusStan,
    mainButton: TextButton(
      onPressed: () async {
        // await opp.dismiss();
        // await Flushbar().dismiss(true);
      },
      child: Text(
        "Dismiss",
        style: Kstyles.kSmallTextStyle.copyWith(
          color: Colors.yellow,
        ),
      ),
    ),
    icon: Opacity(
      opacity: 0.5,
      child: Transform.rotate(
        angle: 32 * pi / 180,
        child: Icon(
          style == ToastStyle.error ? Icons.error : Icons.info,
          color: KColors.whiteColor,
          size: 35,
        ),
      ),
    ),
    backgroundColor:
        style == ToastStyle.error ? KColors.errorColor : KColors.primaryColor,
    flushbarStyle: FlushbarStyle.FLOATING,
    titleText: Text(
      title == null && style == ToastStyle.error
          ? 'Error'
          : title == null && style == ToastStyle.info
              ? 'Success'
              : title!,
      style: Kstyles.kSmallTextStyle.copyWith(
        color: KColors.whiteColor,
      ),
    ),
    messageText: Text(
      message,
      style: Kstyles.kVerySmallTextStyle.copyWith(
        color: KColors.whiteColor,
      ),
    ),
    duration: const Duration(seconds: 1),
  ).show(Navigate.instance.navigationKey.currentState!.context);
}

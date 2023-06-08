import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/widget_utils/toasting.dart';

Future<void> kToast(
    {Color backgroundColor = KColors.yellowColor,
    ToastStyle? style = ToastStyle.info,
    required String message,
    String? title}) async {
  Fluttertoast.showToast(
    backgroundColor: backgroundColor,
    msg: message,
  );
}

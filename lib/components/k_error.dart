import 'package:flutter/material.dart';
import 'package:seezioneprodotto/utils/constants/k_assets.dart';
import 'package:seezioneprodotto/utils/reponsive_utils/responsive_util.dart';

class KError extends StatelessWidget {
  final String? warningText;
  final bool? closed;
  const KError({
    super.key,
    this.closed = false,
    this.warningText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.width(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            closed! ? KAssets.closedWidget : KAssets.errorWidget,
            width: Responsive.width(context) / 1.3,
            height: Responsive.width(context) / 1.5,
          ),
          Text(
            warningText ?? '404! An Error Occured',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: Responsive.getFontSize(16),
            ),
          ),
        ],
      ),
    );
  }
}

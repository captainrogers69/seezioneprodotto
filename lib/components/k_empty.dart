import 'package:seezioneprodotto/utils/constants/k_assets.dart';
import 'package:seezioneprodotto/utils/reponsive_utils/responsive_util.dart';
import 'package:seezioneprodotto/components/sizing_box.dart';
import 'package:flutter/material.dart';
import '../utils/constants/k_styles.dart';

class KEmpty extends StatelessWidget {
  final String? warningText;
  final bool? showRich;
  const KEmpty({
    super.key,
    this.showRich = false,
    this.warningText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 85),
      width: Responsive.width(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            KAssets.emptyWidget,
            width: Responsive.isDesktop(context)
                ? 400
                : Responsive.isTablet(context)
                    ? 200
                    : Responsive.width(context) / 1.3,
            height: Responsive.isDesktop(context)
                ? 400
                : Responsive.isTablet(context)
                    ? 200
                    : Responsive.width(context) / 1.5,
          ),
          const Sbh(h: 20),
          Text(
            warningText ?? 'No results found',
            style: Kstyles.kSmallTextStyle,
          ),
          Visibility(
            visible: showRich!,
            child: TextButton(
              onPressed: () {
                // Navigation.instance.navigateTo(Routes.centreSuggScreen);
              },
              child: Text(
                "Help us",
                style: Kstyles.kSmallTextStyle.copyWith(
                    // color: colorScheme.error,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:seezioneprodotto/components/sizing_box.dart';
import 'package:seezioneprodotto/utils/constants/button_state.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/constants/k_styles.dart';
import 'package:seezioneprodotto/utils/reponsive_utils/size_config.dart';

class KButton extends StatelessWidget {
  final LinearGradient? gradient;
  final ButtonState buttonState;
  final double? width, height;
  final VoidCallback? onTap;
  final String buttonName;
  final Color? hardColor;
  final bool useRed, useGreen, useRoundCorner, useMidRoundCorner, useGrey;
  final double fontSize;
  final String? asset;
  const KButton({
    this.hardColor = KColors.primaryColor,
    this.buttonState = ButtonState.idle,
    this.useMidRoundCorner = true,
    this.useRoundCorner = false,
    required this.buttonName,
    this.useGreen = false,
    this.useGrey = false,
    this.useRed = false,
    required this.onTap,
    this.fontSize = 14,
    this.gradient,
    this.height,
    this.width,
    this.asset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonTheme(
          buttonColor: hardColor != KColors.primaryColor
              ? hardColor
              : useGreen
                  ? KColors.switchColor
                  : useGrey
                      ? KColors().greyColor
                      : KColors.primaryColor,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(useRoundCorner
                  ? 15
                  : useMidRoundCorner
                      ? 5 //10
                      : 4),
            ),
            onPressed: onTap,
            height: height ?? 45,
            minWidth: width ?? size.width * 0.35,
            color: hardColor != KColors.primaryColor
                ? hardColor
                : useGreen
                    ? KColors.switchColor
                    : useGrey
                        ? KColors().greyColor
                        : useRed
                            ? KColors.errorColor
                            : KColors.primaryColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: buttonState == ButtonState.processing
                  ? [
                      const SpinKitThreeBounce(
                        color: KColors.whiteColor,
                        size: 20,
                      ),
                    ]
                  : asset != null
                      ? [
                          Image.asset(
                            asset!,
                            color: KColors.whiteColor,
                            height: 22,
                          ),
                          const Sbw(w: 12),
                          Text(
                            buttonName,
                            style: Kstyles.kAppBarTextStyle.copyWith(
                              color: KColors.whiteColor,
                              fontSize: fontSize,
                            ),
                          ),
                        ]
                      : [
                          Text(
                            buttonName,
                            style: Kstyles.kAppBarTextStyle.copyWith(
                              color: KColors.whiteColor,
                              fontSize: fontSize,
                            ),
                          ),
                        ],
            ),
          ),
        ),
      ],
    );
  }
}

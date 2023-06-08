import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:seezioneprodotto/components/buttons/k_border_button.dart';
import 'package:seezioneprodotto/components/buttons/k_button.dart';
import 'package:seezioneprodotto/components/drag_handle.dart';
import 'package:seezioneprodotto/components/sizing_box.dart';
import 'package:seezioneprodotto/config/routers/nav_service.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/constants/k_styles.dart';
import 'package:seezioneprodotto/utils/reponsive_utils/responsive_util.dart';

class HeadingText extends StatelessWidget {
  final Widget? actionCompo;
  final String heading;
  final double left;
  const HeadingText({
    required this.heading,
    this.actionCompo,
    this.left = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: Kstyles.kMediumTextStyle.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: Responsive.getFontSize(15),
            ),
          ),
          actionCompo ??
              IconButton(
                onPressed: () {
                  Navigate.instance.pushBack();
                },
                icon: const Icon(
                  Icons.close,
                ),
              ),
        ],
      ),
    );
  }
}

class ModernSheet extends StatelessWidget {
  final Widget? mainCompo, footer, header;
  final void Function()? cancelButton, submitButton;
  final String? title, submitTitle;
  const ModernSheet({
    required this.mainCompo,
    required this.title,
    this.cancelButton,
    this.submitButton,
    this.submitTitle,
    this.header,
    this.footer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DragHandle(),
            header ?? HeadingText(heading: title!),
            mainCompo!,
            footer ??
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KBorderButton(
                          buttonName: "Cancel",
                          onTap: cancelButton ??
                              () async {
                                Navigate.instance.pushBack();
                              },
                          width: Responsive.width(context) * .42,
                        ),
                        KButton(
                          buttonName: submitTitle ?? '',
                          onTap: submitButton ??
                              () {
                                log('temp shouldnt');
                              },
                          width: Responsive.width(context) * .42,
                        ),
                      ],
                    ),
                    const Sbh(h: 8),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}

class FooterCompo extends StatelessWidget {
  final Function()? cancelButton, submitButton;
  final String? submitTitle;
  const FooterCompo({
    required this.submitButton,
    this.cancelButton,
    this.submitTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KBorderButton(
              height: 39,
              useRed: true,
              buttonName: "Cancel",
              onTap: cancelButton ??
                  () async {
                    Navigate.instance.pushBack();
                  },
              width: Responsive.width(context) * .42,
            ),
            KButton(
              height: 39,
              hardColor: KColors.yellowColor,
              buttonName: submitTitle ?? '',
              onTap: submitButton,
              width: Responsive.width(context) * .42,
            ),
          ],
        ),
        const Sbh(h: 8),
      ],
    );
  }
}

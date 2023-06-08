import 'package:flutter/material.dart';
import 'package:seezioneprodotto/utils/constants/container_util.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/constants/k_styles.dart';

class KTabs extends StatelessWidget {
  final TabController controller;
  final String? tab1, tab2, tab3, tab4;
  final String? tab5, tab6, tab7, tab8;
  final bool? isScrollable;
  final double? vertMargin;
  final Color? color;
  const KTabs({
    super.key,
    this.color,
    this.vertMargin = 10,
    this.isScrollable = true,
    required this.controller,
    required this.tab1,
    required this.tab2,
    this.tab3,
    this.tab4,
    this.tab5,
    this.tab6,
    this.tab7,
    this.tab8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: vertMargin!),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        // border: Border.all(
        //   width: 2,
        //   color: lightGreyColor,
        // ),
        borderRadius: witRadiusStan,
      ),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: TabBar(
          isScrollable: isScrollable!,
          controller: controller,
          indicatorColor: KColors.yellowColor,
          // indicator: BoxDecoration(
          //   color: KColors.primaryColor.withOpacity(0.2),
          //   borderRadius: BorderRadius.circular(8),
          // ),
          labelColor: KColors.yellowColor,
          labelStyle: Kstyles.kSmallTextStyle.copyWith(
            fontFamily: KFonts.EuclidBold.name,
          ),
          unselectedLabelColor: KColors().greyColor,
          tabs: tab8 != null
              ? [
                  Tab(text: tab1),
                  Tab(text: tab2),
                  Tab(text: tab3),
                  Tab(text: tab4),
                  Tab(text: tab5),
                  Tab(text: tab6),
                  Tab(text: tab7),
                  Tab(text: tab8),
                ]
              : tab4 == null && tab3 != null
                  ? [
                      Tab(text: tab1),
                      Tab(text: tab2),
                      Tab(text: tab3),
                    ]
                  : tab3 == null
                      ? [
                          Tab(text: tab1),
                          Tab(text: tab2),
                        ]
                      : [
                          Tab(text: tab1),
                          Tab(text: tab2),
                          Tab(text: tab3),
                          Tab(text: tab4)
                        ],
        ),
      ),
    );
  }
}

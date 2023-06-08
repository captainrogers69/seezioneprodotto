import 'package:flutter/material.dart';
import 'package:seezioneprodotto/utils/constants/container_util.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/reponsive_utils/responsive_util.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: witRadiusSmall,
            color: KColors.yellowColor,
          ),
          width: Responsive.width(context) * 0.17,
          height: 6,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:seezioneprodotto/utils/constants/container_util.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/reponsive_utils/size_config.dart';

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
          width: size.width * 0.17,
          height: 6,
        ),
      ],
    );
  }
}

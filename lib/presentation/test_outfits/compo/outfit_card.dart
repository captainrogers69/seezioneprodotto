import 'package:flutter/material.dart';
import 'package:seezioneprodotto/components/buttons/k_icon_button.dart';
import 'package:seezioneprodotto/components/sizing_box.dart';
import 'package:seezioneprodotto/domain/models/data_models/seezione_model.dart';
import 'package:seezioneprodotto/utils/constants/container_util.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/constants/k_styles.dart';

class OutfitCard extends StatelessWidget {
  final void Function() onRemove;
  final SeezioneProduct product;
  const OutfitCard({required this.product, required this.onRemove, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: witBoxShadow,
        color: KColors.whiteColor,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: KColors().lightlightGreyColor,
              ),
              borderRadius: witRadiusVerySmall,
              color: KColors().lightlightGreyColor,
              boxShadow: witBoxShadow,
            ),
            // height: 130,
            width: 150,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              product.productImage!,
              height: 130,
              // width: 190,
            ),
          ),
          const Sbw(w: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName!,
                  style: Kstyles.kAppBarTextStyle,
                ),
                Text(
                  product.productSubname!,
                  overflow: TextOverflow.ellipsis,
                  style: Kstyles.kVerySmallTextStyle,
                ),
                Text(
                  product.productDesc!,
                  maxLines: 4,
                  overflow: TextOverflow.clip,
                  style: Kstyles.kVerySmallTextStyle,
                ),
                KIconButton(
                  onTap: onRemove,
                  height: 33,
                  fontSize: 11,
                  icon: Icons.close,
                  buttonName: "REMOVE FROM THE OUTFIT",
                  hardColor: KColors.errorColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

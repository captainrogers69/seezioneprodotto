import 'package:flutter/material.dart';
import 'package:seezioneprodotto/domain/models/data_models/seezione_model.dart';
import 'package:seezioneprodotto/utils/constants/container_util.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/constants/k_styles.dart';

class ProductCard extends StatelessWidget {
  final void Function() onTap;
  final SeezioneProduct product;
  final bool isProductAdded;
  const ProductCard({
    required this.isProductAdded,
    required this.product,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: KColors().transparentColor,
      highlightColor: KColors().transparentColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              const Positioned(
                right: 10,
                bottom: 10,
                child: Icon(
                  Icons.check_circle,
                  color: KColors.yellowColor,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isProductAdded
                        ? KColors.yellowColor
                        : KColors().lightlightGreyColor,
                  ),
                  borderRadius: witRadiusVerySmall,
                  color: KColors().lightlightGreyColor,
                  boxShadow: witBoxShadow,
                ),
                // height: 130,
                width: 170,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  product.productImage!,
                  height: 130,
                  // width: 190,
                ),
              ),
              Visibility(
                visible: isProductAdded,
                child: const Positioned(
                  right: 10,
                  bottom: 10,
                  child: Icon(
                    Icons.check_circle,
                    color: KColors.yellowColor,
                  ),
                ),
              ),
            ],
          ),
          Text(
            product.productName!,
            style: Kstyles.kAppBarTextStyle,
          ),
          Text(
            product.productSubname!,
            overflow: TextOverflow.ellipsis,
            style: Kstyles.kVerySmallTextStyle,
          ),
        ],
      ),
    );
  }
}

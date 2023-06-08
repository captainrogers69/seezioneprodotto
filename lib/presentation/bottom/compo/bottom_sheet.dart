import 'package:flutter/material.dart';
import 'package:seezioneprodotto/components/buttons/k_button.dart';
import 'package:seezioneprodotto/components/buttons/k_icon_button.dart';
import 'package:seezioneprodotto/components/sizing_box.dart';
import 'package:seezioneprodotto/config/routers/nav_service.dart';
import 'package:seezioneprodotto/presentation/test_outfits/compo/select_outfits_sheet.dart';
import 'package:seezioneprodotto/utils/constants/container_util.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/constants/k_routes.dart';
import 'package:seezioneprodotto/utils/reponsive_utils/size_config.dart';

class ProductBottomSheet extends StatelessWidget {
  const ProductBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              KIconButton(
                height: 37,
                width: size.width * .28,
                icon: Icons.list,
                onTap: () {
                  Navigate.instance.navigateTo(KRoutes.outfitScreen);
                },
                buttonName: "OUTFITS",
                hardColor: KColors.yellowColor,
              ),
              const Sbw(w: 8),
              KIconButton(
                height: 37,
                width: size.width * .28,
                icon: Icons.list,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: roundedShapeStan,
                    isScrollControlled: true,
                    builder: (context) {
                      return const SelectOutfitSheet();
                    },
                  );
                },
                buttonName: "ADD TO AN OUTFIT",
                hardColor: KColors.yellowColor,
              ),
              const Sbw(w: 8),
              KButton(
                height: 37,
                width: size.width * .28,
                onTap: () {
                  Navigate.instance.navigateTo(KRoutes.testOutfitScreen);
                },
                buttonName: "GO TO THE TEST",
                hardColor: KColors.yellowColor,
              ),
              const Sbw(w: 8),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seezioneprodotto/components/buttons/k_button.dart';
import 'package:seezioneprodotto/components/buttons/k_icon_button.dart';
import 'package:seezioneprodotto/components/sizing_box.dart';
import 'package:seezioneprodotto/config/routers/nav_service.dart';
import 'package:seezioneprodotto/general_providers.dart';
import 'package:seezioneprodotto/presentation/test_outfits/compo/select_outfits_sheet.dart';
import 'package:seezioneprodotto/utils/constants/container_util.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/constants/k_routes.dart';
import 'package:seezioneprodotto/utils/reponsive_utils/responsive_util.dart';
import 'package:seezioneprodotto/utils/widget_utils/k_toast.dart';

class ProductBottomSheet extends HookConsumerWidget {
  const ProductBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int responsive = Responsive.isMobile(context)
        ? 0
        : Responsive.isTablet(context)
            ? 1
            : 2;
    return SizedBox(
      width: Responsive.width(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              KIconButton(
                height: 37,
                width: responsive == 2
                    ? 170
                    : responsive == 1
                        ? 140
                        : Responsive.width(context) * .28,
                icon: Icons.list,
                onTap: () {
                  if (ref.watch(seezioneProvider).selectedOutfits.isEmpty) {
                    kToast(message: "No Outfits available");
                  } else {
                    Navigate.instance.navigateTo(KRoutes.outfitScreen, args: 0);
                  }
                },
                fontSize: responsive == 0 ? 10 : 14,
                buttonName: "OUTFITS",
                hardColor: KColors.yellowColor,
              ),
              const Sbw(w: 8),
              KIconButton(
                height: 37,
                width: responsive == 2
                    ? 170
                    : responsive == 1
                        ? 140
                        : Responsive.width(context) * .28,
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
                fontSize: responsive == 0 ? 10 : 14,
                buttonName: "ADD TO AN OUTFIT",
                hardColor: KColors.yellowColor,
              ),
              const Sbw(w: 8),
              KButton(
                height: 37,
                width: responsive == 2
                    ? 170
                    : responsive == 1
                        ? 140
                        : Responsive.width(context) * .28,
                onTap: () {
                  Navigate.instance.navigateTo(KRoutes.testOutfitScreen);
                },
                fontSize: responsive == 0 ? 10 : 14,
                buttonName: "GO TO THE TEST",
                hardColor: KColors.yellowColor,
              ),
              const Sbw(w: 8),
            ],
          ),
          const Sbh(h: 8),
        ],
      ),
    );
  }
}

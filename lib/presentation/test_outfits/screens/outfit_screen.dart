import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seezioneprodotto/components/buttons/k_icon_button.dart';
import 'package:seezioneprodotto/components/seezione_appbar.dart';
import 'package:seezioneprodotto/components/sizing_box.dart';
import 'package:seezioneprodotto/config/routers/nav_service.dart';
import 'package:seezioneprodotto/general_providers.dart';
import 'package:seezioneprodotto/presentation/test_outfits/compo/outfit_card.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/constants/k_routes.dart';
import 'package:seezioneprodotto/utils/reponsive_utils/responsive_util.dart';

class OutfitScreen extends HookConsumerWidget {
  static const id = KRoutes.outfitScreen;
  final int outfitIndex;
  const OutfitScreen({required this.outfitIndex, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int responsive = Responsive.isMobile(context)
        ? 0
        : Responsive.isTablet(context)
            ? 1
            : 2;
    return Scaffold(
      appBar: const SeezioneAppBar(
        title: "Your Outfits",
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: Responsive.width(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                  icon: Icons.add_circle,
                  onTap: () {
                    Navigate.instance.pushBack();
                    Navigate.instance.pushBack();
                  },
                  fontSize: responsive == 0 ? 10 : 14,
                  buttonName: "ADD TO THIS OUTFITS",
                  hardColor: KColors.yellowColor,
                ),
                const Sbw(w: 8),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                ref
                    .watch(seezioneProvider)
                    .selectedOutfits[outfitIndex]
                    .keys
                    .elementAt(0),
              ),
            ),
            const Sbh(h: 5),
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: ref
                  .watch(seezioneProvider)
                  .selectedOutfits[outfitIndex]
                  .values
                  .elementAt(0)
                  .length,
              itemBuilder: (BuildContext context, int index) {
                final tep =
                    ref.watch(seezioneProvider).selectedOutfits[outfitIndex];
                return OutfitCard(
                  product: tep.values.elementAt(0)[index],
                  onRemove: () {
                    ref.read(seezioneProvider).removeProductFromOutfit(
                          product: tep.values.elementAt(0)[index],
                          outfit: tep,
                        );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

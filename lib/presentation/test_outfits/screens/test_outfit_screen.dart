import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seezioneprodotto/components/k_empty.dart';
import 'package:seezioneprodotto/components/seezione_appbar.dart';
import 'package:seezioneprodotto/config/routers/nav_service.dart';
import 'package:seezioneprodotto/general_providers.dart';
import 'package:seezioneprodotto/presentation/bottom/compo/product_card.dart';
import 'package:seezioneprodotto/utils/constants/k_routes.dart';
import 'package:seezioneprodotto/utils/constants/k_styles.dart';

class TestOutfitScreen extends HookConsumerWidget {
  static const id = KRoutes.testOutfitScreen;
  const TestOutfitScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const SeezioneAppBar(title: "Your Outfits to test"),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: ref.watch(seezioneProvider).selectedOutfits.isNotEmpty,
            replacement: const KEmpty(warningText: "No Outfits to test Yet!"),
            child: ListView.builder(
              itemCount: ref.watch(seezioneProvider).selectedOutfits.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final temp = ref.watch(seezioneProvider).selectedOutfits;

                return ExpansionTile(
                  trailing: IconButton(
                    onPressed: () {
                      Navigate.instance.navigateTo(
                        KRoutes.outfitScreen,
                        args: index,
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  title: Text(
                    temp[index].keys.elementAt(0).toUpperCase(),
                    style: Kstyles.kAppBarTextStyle,
                  ),
                  initiallyExpanded: true,
                  expandedAlignment: Alignment.centerLeft,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(
                          temp[index].values.elementAt(0).length,
                          (j) => ProductCard(
                            isProductAdded: false,
                            product: temp[index].values.elementAt(0)[j],
                            onTap: () {},
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

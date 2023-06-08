import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seezioneprodotto/components/k_tabs.dart';
import 'package:seezioneprodotto/components/sizing_box.dart';
import 'package:seezioneprodotto/config/routers/nav_service.dart';
import 'package:seezioneprodotto/data_source/local_data/seezione_data.dart';
import 'package:seezioneprodotto/general_providers.dart';
import 'package:seezioneprodotto/presentation/bottom/compo/bottom_sheet.dart';
import 'package:seezioneprodotto/presentation/bottom/compo/product_card.dart';
import 'package:seezioneprodotto/presentation/bottom/compo/side_menu.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/constants/k_routes.dart';
import 'package:seezioneprodotto/utils/constants/k_styles.dart';
import 'package:seezioneprodotto/utils/reponsive_utils/responsive_util.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class BottomScreen extends HookConsumerWidget {
  static const id = KRoutes.bottomScreen;
  const BottomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
    TabController tabController = useTabController(initialLength: 8);
    return Scaffold(
      key: drawerKey,
      drawer: SideMenu(drawerKey: drawerKey),
      appBar: AppBar(
        // elevation: 6,
        title: Text(
          "Menu",
          style: Kstyles.kAppBarTextStyle.copyWith(
            fontFamily: KFonts.EuclidBold.name,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigate.instance.navigateTo(KRoutes.testOutfitScreen);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "GO TO THE TEST",
                  style: Kstyles.kAppBarTextStyle,
                ),
                Sbw(w: 5),
                Icon(
                  Icons.arrow_forward,
                  color: KColors.blackColor,
                  size: 21,
                )
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Visibility(
        visible: ref.watch(seezioneProvider).selectedProducts.isNotEmpty,
        child: const ProductBottomSheet(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8).copyWith(
          bottom:
              ref.watch(seezioneProvider).selectedProducts.isEmpty ? 10 : 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select a Product to try",
              style: Kstyles.kHeadingTextStyle,
            ),
            KTabs(
              controller: tabController,
              tab1: "ALL CATEGORIES",
              tab2: "COATS",
              tab3: "SWEATERS",
              tab4: "TROUSERS",
              tab5: "SHIRT",
              tab6: "T-SHIRT",
              tab7: "SHORTS",
              tab8: "SHOES",
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                physics: const BouncingScrollPhysics(),
                children: List.generate(
                  8,
                  (index) {
                    return StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      staggeredTileBuilder: (int index) =>
                          const StaggeredTile.fit(1),
                      mainAxisSpacing: 14.0,
                      crossAxisSpacing: 0.0,
                      primary: false,
                      padding: const EdgeInsets.all(4),
                      itemCount: seezioneProducts.length,
                      crossAxisCount: Responsive.isMobile(context)
                          ? 3
                          : Responsive.isTablet(context)
                              ? 4
                              : 5,
                      itemBuilder: (BuildContext context, int j) {
                        return ProductCard(
                          onTap: () {
                            ref
                                .read(seezioneProvider)
                                .configProduct(product: seezioneProducts[j]);
                          },
                          isProductAdded: ref
                              .watch(seezioneProvider)
                              .isProductAdded(product: seezioneProducts[j]),
                          product: seezioneProducts[j],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

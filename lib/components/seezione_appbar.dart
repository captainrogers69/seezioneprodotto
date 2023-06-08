import 'package:flutter/material.dart';
import 'package:seezioneprodotto/utils/constants/k_assets.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/constants/k_styles.dart';

class SeezioneAppBar extends StatelessWidget with PreferredSizeWidget {
  final GlobalKey<ScaffoldState>? drawerKey;
  final String? title;
  final bool? shouldBack;
  final List<Widget>? actions;
  const SeezioneAppBar({
    this.drawerKey,
    this.shouldBack = true,
    this.actions,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: KColors.whiteColor,
      // leading: const SizedBox(),
      elevation: 0,
      leading: shouldBack!
          ? const BackButton(color: KColors.blackColor)
          : IconButton(
              onPressed: () {
                drawerKey!.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
              ),
            ),
      title: Row(
        children: [
          Text(
            title!,
            style: Kstyles.kAppBarTextStyle.copyWith(
              color: KColors.blackColor,
              fontFamily: KFonts.UbuntuBold.name,
            ),
          ),
          const Spacer(flex: 4),
          Image.asset(
            KAssets.logo,
            scale: 3,
          ),
          Spacer(flex: actions == null ? 5 : 4),
        ],
      ),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

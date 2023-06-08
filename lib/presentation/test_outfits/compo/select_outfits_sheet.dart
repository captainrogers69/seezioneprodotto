import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seezioneprodotto/components/buttons/k_button.dart';
import 'package:seezioneprodotto/components/drag_handle.dart';
import 'package:seezioneprodotto/components/k_dividers.dart';
import 'package:seezioneprodotto/components/k_empty.dart';
import 'package:seezioneprodotto/components/sizing_box.dart';
import 'package:seezioneprodotto/config/routers/nav_service.dart';
import 'package:seezioneprodotto/general_providers.dart';
import 'package:seezioneprodotto/presentation/test_outfits/compo/create_outfit_sheet.dart';
import 'package:seezioneprodotto/utils/constants/container_util.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/constants/k_styles.dart';
import 'package:seezioneprodotto/utils/reponsive_utils/size_config.dart';

class SelectOutfitSheet extends HookConsumerWidget {
  const SelectOutfitSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DragHandle(),
            Visibility(
              visible: ref.watch(seezioneProvider).selectedOutfits.isNotEmpty,
              replacement: const KEmpty(warningText: "No Outfits Yet!"),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: ref.watch(seezioneProvider).selectedOutfits.length,
                itemBuilder: (BuildContext context, int index) {
                  final temp = ref.watch(seezioneProvider).selectedOutfits;
                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 15,
                      backgroundColor: KColors.yellowColor,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      ref
                          .read(seezioneProvider)
                          .configOutfits(outfit: temp[index]);
                    },
                    title: Text(
                      temp[index].keys.elementAt(0),
                      style: Kstyles.kAppBarTextStyle,
                    ),
                    subtitle: Text(
                      temp[index].values.elementAt(0).length.toString(),
                      style: Kstyles.kSmallTextStyle.copyWith(
                        color: KColors().greyColor,
                      ),
                    ),
                  );
                },
              ),
            ),
            const KOrDivider(),
            KButton(
              buttonName: "Create An Outfit",
              height: 38,
              width: size.width * .95,
              hardColor: KColors.yellowColor,
              onTap: () {
                Navigate.instance.pushBack();
                showModalBottomSheet(
                  context: context,
                  shape: roundedShapeStan,
                  isScrollControlled: true,
                  builder: (context) {
                    return const CreateOutfitSheet();
                  },
                );
              },
            ),
            const Sbh(h: 10),
          ],
        ),
      ),
    );
  }
}

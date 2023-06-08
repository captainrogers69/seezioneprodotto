import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seezioneprodotto/components/drag_handle.dart';
import 'package:seezioneprodotto/components/modern_sheet.dart';
import 'package:seezioneprodotto/components/sizing_box.dart';
import 'package:seezioneprodotto/components/textfields/detail_textfield.dart';
import 'package:seezioneprodotto/general_providers.dart';

class CreateOutfitSheet extends HookConsumerWidget {
  const CreateOutfitSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController outfitName = useTextEditingController();
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DragHandle(),
            const HeadingText(
              heading: "Create an Outfit",
              actionCompo: SizedBox(),
            ),
            DetailTextfield(
              labelText: "",
              controller: outfitName,
              hintText: "Enter Outfit Name",
            ),
            const Sbh(h: 11),
            FooterCompo(
              submitTitle: "Create Outfit",
              submitButton: () {
                ref
                    .read(seezioneProvider)
                    .configNewOutfit(outfit: outfitName.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}

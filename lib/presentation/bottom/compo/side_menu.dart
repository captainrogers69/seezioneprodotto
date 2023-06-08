import 'package:flutter/material.dart';
import 'package:seezioneprodotto/utils/reponsive_utils/size_config.dart';

class SideMenu extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey;
  const SideMenu({required this.drawerKey, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: size.width * 0.6,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200.0,
              width: size.width * 0.6,
            ),
          ],
        ),
      ),
    );
  }
}

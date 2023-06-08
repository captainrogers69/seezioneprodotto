import 'package:flutter/material.dart';
import 'package:seezioneprodotto/utils/reponsive_utils/responsive_util.dart';

class SideMenu extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey;
  const SideMenu({required this.drawerKey, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Responsive.width(context) * 0.6,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200.0,
              width: Responsive.width(context) * 0.6,
            ),
          ],
        ),
      ),
    );
  }
}

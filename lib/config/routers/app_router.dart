import 'package:flutter/material.dart';
import 'package:seezioneprodotto/components/route_error.dart';
import 'package:seezioneprodotto/presentation/bottom/screens/bottom_screen.dart';
import 'package:seezioneprodotto/presentation/test_outfits/screens/outfit_screen.dart';
import 'package:seezioneprodotto/presentation/test_outfits/screens/test_outfit_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings route) {
    // const PageTransitionType pageStyle = PageTransitionType.rightToLeft;

    switch (route.name) {
      case BottomScreen.id:
        // return PageTransition(child: const WelcomeScreen(), type: pageStyle);
        return MaterialPageRoute(builder: (context) => const BottomScreen());
      case TestOutfitScreen.id:
        return MaterialPageRoute(
            builder: (context) => const TestOutfitScreen());
      case OutfitScreen.id:
        final tep = route.arguments as int;
        return MaterialPageRoute(
            builder: (context) => OutfitScreen(outfitIndex: tep));

      default:
        return MaterialPageRoute(
          builder: (context) => const RouteError(),
        );
    }
  }
}

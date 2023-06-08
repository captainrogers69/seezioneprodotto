// import 'package:flutter/material.dart';

// class SizeConfig {
//   static MediaQueryData? _mediaQueryData;
//   static double? screenWidth;
//   static double? screenHeight;
//   static double? defaultSize;
//   static Orientation? orientation;

//   void init(BuildContext context) {
//     _mediaQueryData = MediaQuery.of(context);
//     screenWidth = _mediaQueryData!.size.width;
//     screenHeight = _mediaQueryData!.size.height;
//     orientation = _mediaQueryData!.orientation;
//   }
// }

// double getProportionateScreenHeight(double inputHeight) {
//   double screenHeight = SizeConfig.screenHeight!;
//   return (inputHeight / 812.0) * screenHeight;
// }

// double getProportionateScreenWidth(double inputWidth) {
//   double screenWidth = SizeConfig.screenWidth!;

//   return (inputWidth / 375.0) * screenWidth;
// }

// final window = WidgetsBinding.instance.window;
// Size size = window.physicalSize / window.devicePixelRatio;

// double getHorizontalSize(double px) => px * (size.width / 375);

// double getVerticalSize(double px) {
//   num statusBar = MediaQueryData.fromWindow(window).viewPadding.top;
//   num screenHeight = size.height - statusBar;
//   return px * (screenHeight / 812);
// }

// double getSize(double px) {
//   final height = getVerticalSize(px);
//   final width = getHorizontalSize(px);

//   if (height < width) {
//     return height.toInt().toDouble();
//   } else {
//     return width.toInt().toDouble();
//   }
// }

// double getFontSize(double px) => getSize(px);

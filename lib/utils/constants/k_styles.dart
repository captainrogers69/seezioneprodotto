// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';

enum KFonts { EuclidBold, EuclidRegular, BalooChettan2, Poppins }

class Kstyles {
  final kSplashStyle = TextStyle(
    fontFamily: KFonts.BalooChettan2.name,
    fontSize: 20,
    color: const Color(0xff2e3191),
    fontWeight: FontWeight.bold,
  );
// class WitStyles {
  static const kHeadingTextStyle = TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.0022500000894069673,
      fontStyle: FontStyle.normal);

  static const kButtonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const kSubHeadingStyle = TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.0015000000223517411,
      fontWeight: FontWeight.w600);

  static const kMediumTextStyle = TextStyle(
      fontSize: 15.8,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.0022500000894069673);

  static const kSmallTextStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.0015000000223517411);

  static const kAppBarTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    color: KColors.blackColor,
    letterSpacing: 0.0022500000894069673,
    fontStyle: FontStyle.normal,
    fontSize: 15.5,
  );

  static const kVerySmallTextStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 11,
      letterSpacing: 0.0105);

  static const headingText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const contentText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

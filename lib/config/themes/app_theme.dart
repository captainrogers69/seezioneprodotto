import 'package:flutter/material.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/constants/k_styles.dart';

class AppTheme {
  AppTheme._();
  static final lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: KColors.whiteColor,
    //  const Color(0xffeeefee),
    // primaryColor: primaryColor,
    cardColor: Colors.white,
    fontFamily: KFonts.EuclidBold.name,
    appBarTheme: AppBarTheme(
      // backgroundColor: primaryColor,
      titleTextStyle: Kstyles.kAppBarTextStyle.copyWith(
          // color: darkGreyColor,
          ),
      // color: whiteColor,
      iconTheme: const IconThemeData(
          // color: whiteColor,
          ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.black,
      ),
    ),
    buttonTheme: const ButtonThemeData(
        // buttonColor: whiteColor,
        ),
    // colorScheme: ColorScheme(
    //   background: Colors.black,
    // ),
  );
  static final darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: const Color(0xff04b4f3),
    cardColor: Colors.white,
    fontFamily: KFonts.Poppins.name,
    scaffoldBackgroundColor: const Color(0xFF0f101c),
    appBarTheme: AppBarTheme(
      // color: whiteColor,
      titleTextStyle: Kstyles.kAppBarTextStyle.copyWith(
        fontFamily: KFonts.EuclidBold.name,
      ),
      iconTheme: const IconThemeData(
          // color: whiteColor,
          ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Color(0xffffffff),
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
    ),
    // colorScheme: ColorScheme(background: Colors.white),
  );
}

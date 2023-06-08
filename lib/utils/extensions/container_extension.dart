import 'package:flutter/material.dart';

extension Neumorphism on Widget {
  containerExtension(
      {Color bottomShadowColor = const Color(0x26234395),
      Color topShadowColor = Colors.white60,
      Offset offset = const Offset(5, 5),
      double borderRadius = 10.0,
      double blurRadius = 10}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        boxShadow: [
          BoxShadow(
            offset: offset,
            blurRadius: blurRadius,
            color: bottomShadowColor,
          ),
          BoxShadow(
            offset: Offset(-offset.dx, -offset.dx),
            blurRadius: blurRadius,
            color: topShadowColor,
          ),
        ],
      ),
      child: this,
    );
  }
}

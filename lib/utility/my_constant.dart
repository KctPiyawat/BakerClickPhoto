import 'package:flutter/material.dart';

class MyConstant {
  // for Route
  static String routePhotoService = '/photoService';

  // for Image
  static String image1 = 'images/image1.png';
  static String image2 = 'images/image2.png';
  static String icon = 'images/icon.png';

  // for Color
  static Color primary = Color(0xff616161);
  static Color dark = Color(0xffbb4d00);
  static Color light = Color(0xff8e8e8e);

  // for Style
  TextStyle h1Style() => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: dark,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: dark,
      );

  TextStyle h2BuleStyle() => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.blue.shade900,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: dark,
      );

  TextStyle h3PrimaryStyle() => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: primary,
      );

  TextStyle h3mornalStyle() => TextStyle(
        fontSize: 14,
        color: dark,
      );
}

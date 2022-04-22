import 'package:flutter/material.dart';

class MyConstant {
  static String appName = 'Check Packge Picture';
  // for Route
  static String routePhotoService = '/photoService';

  // for Image
  static String image1 = 'images/image1.png';
  static String image2 = 'images/image2.png';
  static String icon = 'images/icon.png';
  static String domainImage = 'http://210.86.171.110:89/shopeepic/';

  // for Color
  static Color primary = Color(0xfff57c00);
  static Color dark = Color.fromARGB(255, 199, 85, 3);
  static Color light = Color.fromARGB(255, 226, 161, 75);

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
        fontWeight: FontWeight.normal,
        color: dark,
      );
  TextStyle h3mornalButtonStyle() => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 18, 76, 123),
      );
}

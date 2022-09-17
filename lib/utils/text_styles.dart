import 'package:flutter/material.dart';

class TextStyles {
  static final TextStyles _instance = TextStyles._internal();

  factory TextStyles() {
    return _instance;
  }
  TextStyles._internal();

  TextStyle get body => TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 16,
        color: Colors.black.withOpacity(0.9),
      );
  TextStyle get bodyBold => TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black.withOpacity(0.9));

  TextStyle get categoryText => const TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black);

  TextStyle get subtitle1 => TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.25,
      color: Colors.black.withOpacity(0.65));
  TextStyle get subtitle1Light => TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.25,
      color: Colors.white.withOpacity(0.65));

  TextStyle get bodyLight => TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white.withOpacity(0.9));
  TextStyle get subtitle2Light => TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white.withOpacity(0.5));
  TextStyle get subtitle2 => TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black.withOpacity(0.65));
  TextStyle get tileSubtitle => TextStyle(
      fontFamily: 'Gilroy', fontSize: 14, color: Colors.black.withOpacity(0.9));
  TextStyle get title => const TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Color(0xff464040));
  TextStyle get titleLight => const TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );
  TextStyle get largeText => const TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black);
  TextStyle get headerText => const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xff464040));
  TextStyle get tileTitle => const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
}

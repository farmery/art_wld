import 'package:flutter/material.dart';

class AppColors {
  bool isDarkMode = false;
  static final AppColors _instance = AppColors._internal();
  AppColors._internal();
  factory AppColors() {
    return _instance;
  }

  Color get accent => const Color(0xff242323);
  Color get success => const Color(0xff39894F);
  Color get primary => isDarkMode ? Colors.black : const Color(0xffFFFFFF);
  Color get reversePrimary => isDarkMode ? Colors.white : Colors.black;
  final Color offWhite = const Color(0xFFDCDCDC);
  final Color cardColor = Colors.transparent;
  Color get lineColor => isDarkMode
      ? Colors.white.withOpacity(0.4)
      : Colors.black.withOpacity(0.4);
  final Color white = Colors.white;
  final Color black = Colors.black;
}

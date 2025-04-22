import 'package:flutter/material.dart';

class NavigationTheme {
  static const selectedItemColor = Colors.blue;
  static const unselectedItemColor = Colors.grey;
  static const backgroundColor = Colors.white;

  static BottomNavigationBarThemeData get barTheme => const BottomNavigationBarThemeData(
    selectedItemColor: selectedItemColor,
    unselectedItemColor: unselectedItemColor,
    backgroundColor: backgroundColor,
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
  );
}

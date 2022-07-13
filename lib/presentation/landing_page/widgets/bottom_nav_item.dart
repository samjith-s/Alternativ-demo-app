import 'package:flutter/material.dart';

BottomNavigationBarItem bottomNavBarItem({required IconData icon, required String label}) {
  return BottomNavigationBarItem(
    icon: Icon(
      icon,
    ), //giv common style
    label: label, //give common textstyle
  );
}

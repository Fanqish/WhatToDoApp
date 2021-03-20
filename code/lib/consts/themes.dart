import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color mainColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];

Rx<ThemeMode> themeModeNow = ThemeMode.system.obs;

class Themes {
  static final light = ThemeData.light().copyWith(
    primaryColor: mainColor,
    scaffoldBackgroundColor: mainColor,
  );
  static final dark = ThemeData.dark().copyWith();
}

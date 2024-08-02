import 'package:flutter/material.dart';
import 'package:music_player/gen/colors.gen.dart';

ThemeData themeData() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFD9D9D9),
    colorSchemeSeed: ColorName.primaryColor,
    sliderTheme: SliderThemeData(
      trackHeight: 10,
      showValueIndicator: ShowValueIndicator.never,
      thumbShape: SliderComponentShape.noThumb,
      activeTrackColor: const Color(0xFFCF98BB),
      inactiveTrackColor: ColorName.foregroundColor,
      disabledActiveTrackColor: Colors.amber,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: ColorName.white,
      ),
      titleSmall: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w400,
        color: ColorName.white,
      ),
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: ColorName.white,
      ),
    ),
  );
}

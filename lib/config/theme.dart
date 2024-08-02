import 'package:flutter/material.dart';
import 'package:music_player/gen/colors.gen.dart';

/// Creates the theme data for the music player application.
///
/// This function defines the overall theme of the application, including
/// colors, typography, and other visual elements.
ThemeData themeData() {
  return ThemeData(
    /// Sets the background color of the scaffold (main content area).
    scaffoldBackgroundColor: const Color(0xFFD9D9D9),

    /// Sets the color scheme seed, which is used to generate the color scheme.
    colorSchemeSeed: ColorName.primaryColor,

    /// Customizes the slider theme.
    sliderTheme: SliderThemeData(
      /// Sets the height of the slider track.
      trackHeight: 10,

      /// Disables the display of the value indicator.
      showValueIndicator: ShowValueIndicator.never,

      /// Removes the thumb shape from the slider.
      thumbShape: SliderComponentShape.noThumb,

      /// Sets the color of the active track.
      activeTrackColor: const Color(0xFFCF98BB),

      /// Sets the color of the inactive track.
      inactiveTrackColor: ColorName.foregroundColor,

      /// Sets the color of the disabled active track.
      disabledActiveTrackColor: ColorName.primaryColor,
    ),

    /// Customizes the text theme.
    textTheme: const TextTheme(
      /// Defines the style for the `titleMedium` text style.
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: ColorName.white,
      ),

      /// Defines the style for the `titleSmall` text style.
      titleSmall: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w400,
        color: ColorName.white,
      ),

      /// Defines the style for the `titleLarge` text style.
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: ColorName.white,
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:music_player/gen/colors.gen.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// A custom back button widget styled with a plinko effect.
///
/// This widget displays a back button with a visual effect that resembles
/// balls bouncing down a plinko board. It uses a combination of positioned
/// dots and an elevated button to create the effect.
class PlinkoBackButton extends StatelessWidget {
  /// Creates a new instance of the `PlinkoBackButton` widget.
  const PlinkoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Stack(
        children: [
          // The main button element, styled with a rounded shape and primary color.
          SizedBox(
            width: 100.sh, // Width of the button, scaled based on screen height
            height: 70, // Height of the button
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    ColorName.primaryColor, // Primary color for the button
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      50), // Rounded corners for the button
                ),
              ),
              onPressed: () {
                // Implement the back button functionality here.
                // For example, you can use Navigator.pop(context) to go back.
              },
              child: const SizedBox
                  .shrink(), // No child widget, as the button is purely visual
            ),
          ),

          // A series of positioned dots to create the plinko effect.
          // Each dot is styled with a different opacity and position.
          _buildDot(
            color: ColorName.lightPink
                .withOpacity(0.2), // Light pink with 20% opacity
            left: 2.sh, // Positioned 2 screen height units from the left
          ),
          _buildDot(
            color: ColorName.lightPink
                .withOpacity(0.1), // Light pink with 10% opacity
            left: 4.sh, // Positioned 4 screen height units from the left
          ),
          _buildDot(
            color: ColorName.lightPink
                .withOpacity(0.05), // Light pink with 5% opacity
            left: 6.sh, // Positioned 6 screen height units from the left
          ),
          _buildDot(
            color: ColorName.lightPink
                .withOpacity(0.5), // Light pink with 50% opacity
            left: 8.sh, // Positioned 8 screen height units from the left
          ),
          // ... (More dots with different positions and opacities)

          // A positioned text widget to display the button label.
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                // Implement the back button functionality here.
                // For example, you can use Navigator.pop(context) to go back.
              },
              child: Align(
                child: Text(
                  'Back to Plinko', // Label for the back button
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium, // Text style for the label
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Builds a single dot for the plinko effect.
  ///
  /// This method takes a color, top, left, right, and bottom position as input
  /// and returns a positioned InkWell widget with a circular container.
  _buildDot({
    required Color color, // Color of the dot
    double? top, // Top position of the dot
    double? left, // Left position of the dot
    double? right, // Right position of the dot
    double? bottom, // Bottom position of the dot
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: InkWell(
        onTap: () {
          // Implement the back button functionality here.
          // For example, you can use Navigator.pop(context) to go back.
        },
        child: Align(
          child: Container(
            width: 7, // Width of the dot
            height: 7, // Height of the dot
            decoration: BoxDecoration(
              color: color, // Color of the dot
              borderRadius:
                  BorderRadius.circular(100), // Circular shape for the dot
            ),
          ),
        ),
      ),
    );
  }
}

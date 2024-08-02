import 'package:flutter/material.dart';
import 'package:music_player/gen/colors.gen.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// A custom back button widget that resembles the classic Plinko game.
///
/// This widget uses a stack of positioned dots to create the visual effect of
/// Plinko pegs. The text "Back to Plinko" is centered on the button and is
/// tappable.
class PlinkoBackButton extends StatelessWidget {
  /// Creates a new instance of the `PlinkoBackButton` widget.
  const PlinkoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Stack(
        children: [
          /// The base button, which is a rounded rectangle with the primary color.
          SizedBox(
            width: 100.sh,
            height: 70,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorName.primaryColor,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {},
              child: const SizedBox.shrink(),
            ),
          ),

          /// The Plinko dots, which are positioned to create the visual effect
          /// of pegs.
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.2),
            left: 2.sh,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.1),
            left: 4.sh,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.05),
            left: 6.sh,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.5),
            left: 8.sh,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.5),
            left: 11.sh,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.5),
            left: 14.sh,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.5),
            left: 17.sh,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.5),
            left: 20.sh,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.1),
            right: 2.sh,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.1),
            right: 4.sh,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.1),
            left: 2.sh,
            bottom: 0,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.5),
            left: 5.sh,
            bottom: 0,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.5),
            left: 8.sh,
            bottom: 0,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.5),
            left: 11.sh,
            bottom: 0,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.5),
            left: 14.sh,
            bottom: 0,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.5),
            left: 17.sh,
            bottom: 0,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.5),
            left: 20.sh,
            bottom: 0,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.05),
            right: 2.sh,
            bottom: 0,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.5),
            right: 4.sh,
            bottom: 0,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.1),
            left: 3.sh,
            bottom: 0,
            top: 0,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.3),
            left: 6.5.sh,
            bottom: 0,
            top: 0,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.3),
            left: 9.5.sh,
            bottom: 0,
            top: 0,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.3),
            left: 12.5.sh,
            bottom: 0,
            top: 0,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.3),
            left: 15.5.sh,
            bottom: 0,
            top: 0,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.3),
            left: 18.5.sh,
            bottom: 0,
            top: 0,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.3),
            left: 21.5.sh,
            bottom: 0,
            top: 0,
          ),
          _buildDot(
            color: ColorName.lightPink.withOpacity(0.05),
            right: 2.5.sh,
            bottom: 0,
            top: 0,
          ),

          /// The text label "Back to Plinko", which is centered on the button.
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                // Navigate back to the previous screen.
              },
              child: Align(
                child: Text(
                  'Back to Plinko',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// A helper function to build a single Plinko dot.
  ///
  /// This function takes the color of the dot and optional positioning
  /// parameters as input.
  _buildDot({
    required Color color,
    double? top,
    double? left,
    double? right,
    double? bottom,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: InkWell(
        onTap: () {
          // Handle tap event for the dot.
        },
        child: Align(
          child: Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}

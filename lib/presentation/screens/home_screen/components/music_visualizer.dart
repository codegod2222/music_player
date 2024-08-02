import 'dart:math';

import 'package:flutter/material.dart';
import 'package:music_player/gen/colors.gen.dart';

class MusicVisualizer extends StatefulWidget {
  final bool isPlaying;
  const MusicVisualizer({super.key, required this.isPlaying});

  @override
  State<MusicVisualizer> createState() => _MusicVisualizerState();
}

class _MusicVisualizerState extends State<MusicVisualizer> {
  final Random _random = Random();
  List<int> _waveform = List.generate(32, (index) => 0);

  void _updateVisualizer() {
    Future.doWhile(() async {
      setState(() {
        _waveform = List.generate(32, (index) => _random.nextInt(256));
      });
      await Future.delayed(const Duration(milliseconds: 100));
      return true;
    });
  }

  @override
  void initState() {
    _updateVisualizer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: VisualizerPainter(
            waveform: _waveform,
            isPlaying: widget.isPlaying,
            backgroundColor: ColorName.foregroundColor,
          ),
          child: const SizedBox(
            width: double.infinity,
            height: 250,
          ),
        ),
      ],
    );
  }
}

class VisualizerPainter extends CustomPainter {
  final List<int> waveform;
  final double barGap;
  final double borderRadius;
  final Color backgroundColor;
  final double smoothingFactor;
  final bool isPlaying;

  List<double> _previousHeights;

  VisualizerPainter({
    required this.waveform,
    required this.isPlaying,
    this.barGap = 2.0,
    this.borderRadius = 4.0,
    this.backgroundColor = Colors.black,
    this.smoothingFactor = 0.2,
  }) : _previousHeights = List.filled(waveform.length, 0);

  @override
  void paint(Canvas canvas, Size size) {
    if (isPlaying) {
// Draw background
      canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = backgroundColor,
      );

      final barWidth =
          (size.width - (waveform.length - 1) * barGap) / waveform.length;

      for (int i = 0; i < waveform.length; i++) {
        // Interpolate between the previous height and the current height
        final targetHeight = waveform[i] / 156.0 * size.height;
        _previousHeights[i] = _previousHeights[i] * (1 - smoothingFactor) +
            targetHeight * smoothingFactor;

        final barHeight = _previousHeights[i];
        final barX = i * (barWidth + barGap);

        // Set the color for each bar
        final paint = Paint()
          ..color = i < waveform.length / 2
              ? ColorName.lightPink
              : ColorName.primaryColor.withOpacity(0.5)
          ..style = PaintingStyle.fill;

        // Draw each bar with rounded corners
        final barRect = RRect.fromRectAndRadius(
          Rect.fromLTWH(barX, size.height - barHeight, barWidth, barHeight),
          Radius.circular(borderRadius),
        );
        canvas.drawRRect(barRect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

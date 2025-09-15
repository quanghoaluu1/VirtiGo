import 'package:flutter/material.dart';
import 'package:virtigo/themes/top_wave_clipper.dart';

class GradientBackground extends StatelessWidget {
  final double height;

  const GradientBackground({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.tealAccent, Colors.teal],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
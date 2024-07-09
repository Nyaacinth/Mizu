// https://github.com/lohanidamodar/flutter_custom_clippers

import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Clip widget in wave shape, original name is WaveClipperTwo
class WaveClipper extends CustomClipper<Path> {
  final double progress;
  final double waveFactor;

  WaveClipper({
    double progress = 0.5,
    this.waveFactor = 1,
  }) : progress = 1 - progress;

  @override
  Path getClip(Size size) {
    var path = Path();

    final double amplitude = size.height * 0.05; // 振幅
    final double frequency = 0.003; // 频率
    final double phase = waveFactor * (math.pi * 2); // 相位

    for (double x = 0; x < size.width; x += 1) {
      final double y =
          amplitude * math.sin(2 * math.pi * frequency * x + phase);
      if (x == 0) {
        path.moveTo(x, size.height * progress + y);
      } else {
        path.lineTo(x, size.height * progress + y);
      }
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

import 'package:flutter/material.dart';

import '../clippers/wave_clipper.dart';

class WaterDropIcon extends StatelessWidget {
  final double size;
  final Color currentColor;
  final MaskFilter? maskFilter;
  final double progress;
  final double waveFactor;

  const WaterDropIcon({
    super.key,
    required this.size,
    this.currentColor = Colors.white,
    this.maskFilter,
    this.progress = 1.0,
    this.waveFactor = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(progress: progress, waveFactor: waveFactor),
      child: CustomPaint(
        size: Size(size.toDouble(), size.toDouble()),
        painter: WaterDropCustomPainter(
          currentColor: currentColor,
          maskFilter: maskFilter,
        ),
      ),
    );
  }
}

class WaterDropCustomPainter extends CustomPainter {
  final Color currentColor;
  final MaskFilter? maskFilter;

  const WaterDropCustomPainter({
    this.currentColor = Colors.white,
    this.maskFilter,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = getWaterDropPath(size);

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = currentColor;

    if (maskFilter != null) {
      paint.maskFilter = maskFilter;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Path getWaterDropPath(Size size) {
  Path path = Path();
  path.moveTo(size.width * 0.4998750, size.height * 0.8750000);
  path.cubicTo(
      size.width * 0.4165694,
      size.height * 0.8750000,
      size.width * 0.3471528,
      size.height * 0.8463611,
      size.width * 0.2916250,
      size.height * 0.7890833);
  path.cubicTo(
      size.width * 0.2360972,
      size.height * 0.7317778,
      size.width * 0.2083333,
      size.height * 0.6604583,
      size.width * 0.2083333,
      size.height * 0.5751250);
  path.cubicTo(
      size.width * 0.2083333,
      size.height * 0.5373472,
      size.width * 0.2169444,
      size.height * 0.4992917,
      size.width * 0.2341667,
      size.height * 0.4609583);
  path.cubicTo(
      size.width * 0.2513611,
      size.height * 0.4226250,
      size.width * 0.2728472,
      size.height * 0.3858472,
      size.width * 0.2986250,
      size.height * 0.3506250);
  path.cubicTo(
      size.width * 0.3244583,
      size.height * 0.3153750,
      size.width * 0.3523194,
      size.height * 0.2821528,
      size.width * 0.3822083,
      size.height * 0.2509583);
  path.cubicTo(
      size.width * 0.4121250,
      size.height * 0.2197361,
      size.width * 0.4399028,
      size.height * 0.1925694,
      size.width * 0.4655417,
      size.height * 0.1694583);
  path.cubicTo(
      size.width * 0.4705417,
      size.height * 0.1649861,
      size.width * 0.4760000,
      size.height * 0.1615278,
      size.width * 0.4819167,
      size.height * 0.1590833);
  path.cubicTo(
      size.width * 0.4878055,
      size.height * 0.1566667,
      size.width * 0.4938333,
      size.height * 0.1554583,
      size.width * 0.5000000,
      size.height * 0.1554583);
  path.cubicTo(
      size.width * 0.5061667,
      size.height * 0.1554583,
      size.width * 0.5121945,
      size.height * 0.1566667,
      size.width * 0.5180833,
      size.height * 0.1590833);
  path.cubicTo(
      size.width * 0.5239722,
      size.height * 0.1615000,
      size.width * 0.5294305,
      size.height * 0.1649722,
      size.width * 0.5344583,
      size.height * 0.1695000);
  path.cubicTo(
      size.width * 0.5600972,
      size.height * 0.1925556,
      size.width * 0.5878750,
      size.height * 0.2197083,
      size.width * 0.6177917,
      size.height * 0.2509583);
  path.cubicTo(
      size.width * 0.6477083,
      size.height * 0.2821528,
      size.width * 0.6755695,
      size.height * 0.3153611,
      size.width * 0.7013750,
      size.height * 0.3505833);
  path.cubicTo(
      size.width * 0.7271805,
      size.height * 0.3858056,
      size.width * 0.7486805,
      size.height * 0.4225972,
      size.width * 0.7658750,
      size.height * 0.4609583);
  path.cubicTo(
      size.width * 0.7830695,
      size.height * 0.4993195,
      size.width * 0.7916667,
      size.height * 0.5373750,
      size.width * 0.7916667,
      size.height * 0.5751250);
  path.cubicTo(
      size.width * 0.7916667,
      size.height * 0.6604583,
      size.width * 0.7638611,
      size.height * 0.7317778,
      size.width * 0.7082500,
      size.height * 0.7890833);
  path.cubicTo(
      size.width * 0.6525833,
      size.height * 0.8463611,
      size.width * 0.5831111,
      size.height * 0.8750000,
      size.width * 0.4998333,
      size.height * 0.8750000);
  return path;
}

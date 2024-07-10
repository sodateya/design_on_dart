import 'dart:math';

import 'package:flutter/material.dart';

class Sun extends StatelessWidget {
  const Sun({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SunPainter(),
    );
  }
}

class SunPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    // 中心の円を描画
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 4;
    canvas.drawCircle(center, radius, paint);

    paint.color = Colors.orange;
    final triangleHeight = radius / 2;
    final triangleOffset = radius / 6;
    const angleIncrement = 2 * pi / 8;

    for (int i = 0; i < 8; i++) {
      final angle = i * angleIncrement;
      final x =
          center.dx + (radius + triangleHeight + triangleOffset) * cos(angle);
      final y =
          center.dy + (radius + triangleHeight + triangleOffset) * sin(angle);

      final path = Path();
      path.moveTo(x, y);
      path.lineTo(
        center.dx + (radius + triangleOffset) * cos(angle - angleIncrement / 4),
        center.dy + (radius + triangleOffset) * sin(angle - angleIncrement / 4),
      );
      path.lineTo(
        center.dx + (radius + triangleOffset) * cos(angle + angleIncrement / 4),
        center.dy + (radius + triangleOffset) * sin(angle + angleIncrement / 4),
      );
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

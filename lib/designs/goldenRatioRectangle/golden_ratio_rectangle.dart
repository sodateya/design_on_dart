import 'dart:math';

import 'package:flutter/material.dart';

class GoldenRatioRectangle extends StatelessWidget {
  const GoldenRatioRectangle({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite, // Adjust the size as needed

      painter: SpiralPainter(context, 1),
    );
  }
}

class SpiralPainter extends CustomPainter {
  late BuildContext context;
  int fillPercent; // to show orange fill showing the target progress

  SpiralPainter(this.context, this.fillPercent);

  @override
  void paint(Canvas canvas, Size size) {
    const double radius = 180.0; //radius of outermost spiral arc
    const double strokeWidth = 10; // width of the spiral stroke
    const double radiiDecrement = 30.0; // gap in radius between the spirals
    const double centerShift = 1 +
        (radiiDecrement + strokeWidth) /
            2; // shift in center point between immediate arcs used to create the spiral
    Offset center = Offset(
        0.5 * size.width, 0.5 * size.height); // center of the outermost spiral

    // paint colors and strokes for spiral

    final Paint paintSpiralTargetNotMet = Paint()
      ..color = Colors.black45
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double spiralRadius = radius;
    double userProgress =
        44; //TODO: fetch it from firebase when available, use fillPercent class variable
    double arcFillPercent = (userProgress / 25);
    //this variable is used to determine which arcs will be fully filled or fully unfilled
    int arcFillCount = arcFillPercent.ceil();
    //this variable is used to partially fill an arc with orange color indicating the running progress
    arcFillPercent =
        arcFillPercent - arcFillPercent.floor(); // get fraction part

    // Spiral is drawn using the 4 arcs of reducing radius and shifting center
    // so this loop runs 4 times
    for (var i = 1; i < 10; i++) {
      double sweepAngle = pi;
      double startAngle = pi / 4 + (pi * ((i - 1) % 2));
      if (i > arcFillCount) {
        //whole arc will be unfilled
        canvas.drawArc(Rect.fromCircle(center: center, radius: spiralRadius),
            startAngle, sweepAngle, false, paintSpiralTargetNotMet);
      } else if (i < arcFillCount) {
        //whole arc will be filled
        canvas.drawArc(Rect.fromCircle(center: center, radius: spiralRadius),
            startAngle, sweepAngle, false, paintSpiralTargetNotMet);
      } else {
        if (arcFillPercent == 0) {
          //whole arc will be filled
          canvas.drawArc(Rect.fromCircle(center: center, radius: spiralRadius),
              startAngle, sweepAngle, false, paintSpiralTargetNotMet);
        } else {
          //part of arc will be filled and rest unfilled
          sweepAngle = pi * (arcFillPercent);
          startAngle += pi * (1 - arcFillPercent);
          startAngle =
              startAngle > (2 * pi) ? (startAngle - (2 * pi)) : startAngle;
          canvas.drawArc(Rect.fromCircle(center: center, radius: spiralRadius),
              startAngle, sweepAngle, false, paintSpiralTargetNotMet);

          startAngle = pi / 4 + (pi * ((i - 1) % 2));
          startAngle =
              startAngle > (2 * pi) ? (startAngle - (2 * pi)) : startAngle;
          sweepAngle = pi * (1 - arcFillPercent);
          canvas.drawArc(Rect.fromCircle(center: center, radius: spiralRadius),
              startAngle, sweepAngle, false, paintSpiralTargetNotMet);
        }
      }
      //reduce the radius and shift the center
      spiralRadius -= radiiDecrement;
      if (i % 2 == 0) {
        center -= const Offset(centerShift, centerShift);
      } else {
        center += const Offset(centerShift, centerShift);
      }
    }
    const double smallGoalRadius = 25; // radius of small intermediate targets
    //center of circle from top left corner

    Offset smallGoalCenter =
        center - Offset(radius / sqrt(2), radius / sqrt(2));

    smallGoalCenter = smallGoalCenter.translate(0, 2 * radius / sqrt(2));

    smallGoalCenter = smallGoalCenter.translate(2 * radius / sqrt(2), 0);

    smallGoalCenter =
        smallGoalCenter.translate(0, -2 * (radius - radiiDecrement) / sqrt(2));

    smallGoalCenter = center -
        const Offset(
            radius - 2 * radiiDecrement - strokeWidth / 2, -1 * centerShift);

    smallGoalCenter = smallGoalCenter.translate(
        smallGoalRadius + 2 * radius - 5 * radiiDecrement - strokeWidth, 0);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

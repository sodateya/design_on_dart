import 'package:flutter/material.dart';

class Cat extends StatelessWidget {
  const Cat({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPaint(
      painter: CatPainter(
        baseColor: Color(0xffEDC777),
        patternColor: Color(0xffE09637),
      ),
    );
  }
}

class CatPainter extends CustomPainter {
  const CatPainter(
      {required this.baseColor,
      required this.patternColor,
      this.rightIrisColor,
      this.leftIrisColor,
      this.beardColor});

  final Color baseColor;
  final Color patternColor;
  final Color? rightIrisColor;
  final Color? leftIrisColor;
  final Color? beardColor;

  @override
  void paint(Canvas canvas, Size size) {
    /// Contour
    final Paint fillPaint = Paint()
      ..color = baseColor
      ..style = PaintingStyle.fill;
    final Path path = Path();
    final double width = size.width;
    final double height = size.height;
    path.moveTo(width * 0.2, height * 0.3);
    path.lineTo(width * 0.3, height * 0.1);
    path.lineTo(width * 0.4, height * 0.25);
    path.quadraticBezierTo(
        width * 0.5, height * 0.225, width * 0.6, height * 0.25);
    path.lineTo(width * 0.7, height * 0.1);
    path.lineTo(width * 0.8, height * 0.3);
    path.quadraticBezierTo(
        width * 0.9, height * 0.5, width * 0.7, height * 0.6);
    path.quadraticBezierTo(
        width * 0.5, height * 0.7, width * 0.3, height * 0.6);
    path.quadraticBezierTo(
        width * 0.1, height * 0.5, width * 0.2, height * 0.3);
    path.close();
    canvas.drawPath(path, fillPaint);

    /// Pattern
    var patternPaint = Paint()..color = patternColor;
    var patternPath = Path();
    patternPath.moveTo(width * 0.4, size.height * 0.25);
    patternPath.quadraticBezierTo(
        width * 0.5, height * 0.225, width * 0.6, height * 0.25);
    patternPath.lineTo(width * 0.6, size.height * 0.25);
    patternPath.lineTo(size.width * 0.58, size.height * 0.375);
    patternPath.lineTo(size.width * 0.545, size.height * 0.24);
    patternPath.lineTo(size.width * 0.5, size.height * 0.375);
    patternPath.lineTo(size.width * 0.475, size.height * 0.24);
    patternPath.lineTo(size.width * 0.43, size.height * 0.375);
    canvas.drawPath(patternPath, patternPaint);

    /// Beards
    var beardPaint = Paint()
      ..color = beardColor ?? Colors.black
      ..strokeWidth = width * 0.0025
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double verticalOffset = 0.05;
    double horizontalOffset = 0.05;

    List<double> rightXStartPoints = [0.7, 0.7, 0.7];
    List<double> rightXEndPoints = [0.9, 0.9, 0.9];
    List<double> rightYStartPoints = [0.425, 0.45, 0.475];
    List<double> rightYEndPoints = [0.4, 0.44, 0.475];

    List<double> leftXStartPoints = [0.3, 0.3, 0.3];
    List<double> leftXEndPoints = [0.1, 0.1, 0.1];
    List<double> leftYStartPoints = [0.425, 0.45, 0.475];
    List<double> leftYEndPoints = [0.4, 0.44, 0.475];

    for (int i = 0; i < rightXStartPoints.length; i++) {
      var rightBeardPath = Path();
      rightBeardPath.moveTo(
        size.width * (rightXStartPoints[i] - horizontalOffset),
        size.height * (rightYStartPoints[i] + verticalOffset),
      );
      rightBeardPath.lineTo(
        size.width * (rightXEndPoints[i] - horizontalOffset),
        size.height * (rightYEndPoints[i] + verticalOffset),
      );
      canvas.drawPath(rightBeardPath, beardPaint);

      var leftBeardPath = Path();
      leftBeardPath.moveTo(
        size.width * (leftXStartPoints[i] + horizontalOffset),
        size.height * (leftYStartPoints[i] + verticalOffset),
      );
      leftBeardPath.lineTo(
        size.width * (leftXEndPoints[i] + horizontalOffset),
        size.height * (leftYEndPoints[i] + verticalOffset),
      );
      canvas.drawPath(leftBeardPath, beardPaint);
    }

    /// Eyes
    var eyePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var reflectionPaint = Paint()
      ..color = Colors.white70
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var rightEyeFillPaints = Paint()
      ..color = rightIrisColor ?? Colors.black
      ..style = PaintingStyle.fill;

    final Path rightEyePath = Path();
    rightEyePath.moveTo(width * 0.6, height * 0.4);
    rightEyePath.arcToPoint(
      Offset(width * 0.7, height * 0.4),
      radius: Radius.circular(width * 0.05),
      clockwise: false,
    );
    rightEyePath.close();
    canvas.drawPath(rightEyePath, eyePaint);

    Offset rightEyeCenter = Offset(width * 0.65, height * 0.425);
    double rightEyeRadius = width * 0.025;
    canvas.drawCircle(rightEyeCenter, rightEyeRadius, rightEyeFillPaints);

    Offset rightEyeReflectionsCenter = Offset(width * 0.64, height * 0.415);
    double rightEyeReflectionsRadius = width * 0.005;
    canvas.drawCircle(
        rightEyeReflectionsCenter, rightEyeReflectionsRadius, reflectionPaint);

    var leftEyeFillPaints = Paint()
      ..color = leftIrisColor ?? Colors.black
      ..style = PaintingStyle.fill;
    final Path leftEyePath = Path();
    leftEyePath.moveTo(width * 0.3, height * 0.4);
    leftEyePath.arcToPoint(
      Offset(width * 0.4, height * 0.4),
      radius: Radius.circular(width * 0.05),
      clockwise: false,
    );

    leftEyePath.close();
    canvas.drawPath(leftEyePath, eyePaint);
    Offset leftEyeCenter = Offset(width * 0.35, height * 0.425);
    double leftEyeRadius = width * 0.025;
    canvas.drawCircle(leftEyeCenter, leftEyeRadius, leftEyeFillPaints);
    Offset leftEyeReflectionsCenter = Offset(width * 0.34, height * 0.415);
    double leftEyeReflectionsRadius = width * 0.005;
    canvas.drawCircle(
        leftEyeReflectionsCenter, leftEyeReflectionsRadius, reflectionPaint);

    var strokePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = width * 0.005
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    /// Mouth
    final Path mouthPath = Path();
    mouthPath.moveTo(width * 0.5, height * 0.41);
    mouthPath.quadraticBezierTo(
        width * 0.5, height * 0.5, width * 0.43, height * 0.52);
    mouthPath.moveTo(width * 0.5, height * 0.41);
    mouthPath.quadraticBezierTo(
        width * 0.5, height * 0.5, width * 0.57, height * 0.52);
    canvas.drawPath(mouthPath, strokePaint);
    mouthPath.moveTo(width * 0.47, height * 0.5);
    mouthPath.quadraticBezierTo(
      width * 0.5,
      height * 0.52,
      width * 0.53,
      height * 0.5,
    );
    canvas.drawPath(mouthPath, strokePaint);

    /// Nose
    var nosePaint = Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    final nosePath = Path();
    nosePath.moveTo(width * 0.4825, height * 0.419);
    nosePath.quadraticBezierTo(
        width * 0.5, height * 0.3915, width * 0.5175, height * 0.4195);
    nosePath.quadraticBezierTo(
        width * 0.5, height * 0.43, width * 0.4825, height * 0.4195);

    canvas.drawPath(nosePath, nosePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

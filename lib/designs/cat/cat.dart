import 'package:flutter/material.dart';

class Cat extends StatelessWidget {
  const Cat({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite, // Adjust the size as needed
      painter: CatPainter(
        contourColor: const Color(0xffEDC777),
        patternColor: const Color(0xffE09637),
      ),
    );
  }
}

class CatPainter extends CustomPainter {
  final Color contourColor;
  final Color patternColor;
  final Color rightIrisColor;
  final Color leftIrisColor;
  final Color beardColor;

  CatPainter(
      {required this.contourColor,
      required this.patternColor,
      this.rightIrisColor = Colors.black,
      this.leftIrisColor = Colors.black,
      this.beardColor = Colors.white54});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(-size.width * 0.2, 0);

    _drawContour(canvas, size, contourColor);
    _drawPattern(canvas, size, patternColor);
    _drawBeard(canvas, size, beardColor);
    _drawEyes(canvas, size, rightIrisColor, leftIrisColor);
    _drawMouth(canvas, size);
    _drawNose(canvas, size);
  }

  void _drawContour(Canvas canvas, Size size, Color color) {
    final Paint fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final Path path = Path();
    final double width = size.height * 1.4;
    final double height = size.height * 1.4;

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
  }

  void _drawPattern(Canvas canvas, Size size, Color color) {
    final double width = size.height * 1.4;
    final double height = size.height * 1.4;
    final Paint patternPaint = Paint()..color = color;
    final Path patternPath = Path();

    patternPath.moveTo(width * 0.4, size.height * 1.4 * 0.25);
    patternPath.quadraticBezierTo(
        width * 0.5, height * 0.225, width * 0.6, height * 0.25);
    patternPath.lineTo(width * 0.6, size.height * 1.4 * 0.25);
    patternPath.lineTo(size.height * 1.4 * 0.58, size.height * 1.4 * 0.375);
    patternPath.lineTo(size.height * 1.4 * 0.545, size.height * 1.4 * 0.24);
    patternPath.lineTo(size.height * 1.4 * 0.5, size.height * 1.4 * 0.375);
    patternPath.lineTo(size.height * 1.4 * 0.475, size.height * 1.4 * 0.24);
    patternPath.lineTo(size.height * 1.4 * 0.43, size.height * 1.4 * 0.375);
    canvas.drawPath(patternPath, patternPaint);
  }

  void _drawEyes(
      Canvas canvas, Size size, Color rightIrisColor, Color leftIrisColor) {
    var eyePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 10
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var reflectionPaint = Paint()
      ..color = Colors.white70
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var rightEyeFillPaints = Paint()
      ..color = rightIrisColor
      ..style = PaintingStyle.fill;

    var leftEyeFillPaints = Paint()
      ..color = leftIrisColor
      ..style = PaintingStyle.fill;

    final Path rightEyePath = Path();
    final Path leftEyePath = Path();

    final double width = size.height * 1.4;
    final double height = size.height * 1.4;

    rightEyePath.moveTo(width * 0.6, height * 0.4);
    rightEyePath.arcToPoint(Offset(width * 0.7, height * 0.4),
        radius: Radius.circular(width * 0.05), clockwise: false);
    rightEyePath.close();
    canvas.drawPath(rightEyePath, eyePaint);

    Offset rightEyeCenter = Offset(width * 0.65, height * 0.425);
    double rightEyeRadius = width * 0.025;
    canvas.drawCircle(rightEyeCenter, rightEyeRadius, rightEyeFillPaints);

    Offset rightEyeReflectionsCenter = Offset(width * 0.64, height * 0.415);
    double rightEyeReflectionsRadius = width * 0.005;
    canvas.drawCircle(
        rightEyeReflectionsCenter, rightEyeReflectionsRadius, reflectionPaint);

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
  }

  void _drawMouth(Canvas canvas, Size size) {
    final Paint strokePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = size.height * 1.4 * 0.005
      ..style = PaintingStyle.stroke;

    final double width = size.height * 1.4;
    final double height = size.height * 1.4;

    final Path mouthPath = Path();
    mouthPath.moveTo(width * 0.5, height * 0.41);
    mouthPath.quadraticBezierTo(
        width * 0.5, height * 0.5, width * 0.43, height * 0.52);
    mouthPath.moveTo(width * 0.5, height * 0.41);
    mouthPath.quadraticBezierTo(
        width * 0.5, height * 0.5, width * 0.57, height * 0.52);
    mouthPath.moveTo(width * 0.47, height * 0.5);
    mouthPath.quadraticBezierTo(
        width * 0.5, height * 0.52, width * 0.53, height * 0.5);
    canvas.drawPath(mouthPath, strokePaint);
  }

  void _drawNose(Canvas canvas, Size size) {
    final Paint nosePaint = Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.fill;

    final double width = size.height * 1.4;
    final double height = size.height * 1.4;

    final Path nosePath = Path();
    nosePath.moveTo(width * 0.4825, height * 0.419);
    nosePath.quadraticBezierTo(
        width * 0.5, height * 0.3915, width * 0.5175, height * 0.4195);
    nosePath.quadraticBezierTo(
        width * 0.5, height * 0.43, width * 0.4825, height * 0.4195);
    canvas.drawPath(nosePath, nosePaint);
  }

  void _drawBeard(Canvas canvas, Size size, Color color) {
    var beardPaint = Paint()
      ..color = color
      ..strokeWidth = size.height * 1.4 * 0.0025
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    List<double> startPoints = [0.475, 0.5, 0.525];
    List<double> endPoints = [0.45, 0.49, 0.525];

    for (int i = 0; i < 3; i++) {
      var rightBeardPath = Path();
      var leftBeardPath = Path();
      rightBeardPath.moveTo(
          size.height * 1.4 * 0.65, size.height * 1.4 * startPoints[i]);
      rightBeardPath.lineTo(
          size.height * 1.4 * 0.85, size.height * 1.4 * endPoints[i]);
      canvas.drawPath(rightBeardPath, beardPaint);

      leftBeardPath.moveTo(
          size.height * 1.4 * 0.35, size.height * 1.4 * startPoints[i]);
      leftBeardPath.lineTo(
          size.height * 1.4 * 0.15, size.height * 1.4 * endPoints[i]);
      canvas.drawPath(leftBeardPath, beardPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

import 'package:flutter/material.dart';

// class CatPainter extends CustomPainter {
//   final Color contourColor;
//   final Color patternColor;
//   final Color? rightIrisColor;
//   final Color? leftIrisColor;
//   final Color? beardColor;

//   CatPainter({
//     required this.contourColor,
//     required this.patternColor,
//     this.rightIrisColor,
//     this.leftIrisColor,
//     this.beardColor,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     ContourPainter(contourColor).paint(canvas, size);
//     PatternPainter(patternColor).paint(canvas, size);
//     BeardPainter(beardColor ?? Colors.white54).paint(canvas, size);
//     EyesPainter(
//       rightIrisColor: rightIrisColor ?? Colors.black,
//       leftIrisColor: leftIrisColor ?? Colors.black,
//     ).paint(canvas, size);
//     MouthPainter().paint(canvas, size);
//     NosePainter().paint(canvas, size);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

class ContourPainter extends CustomPainter {
  final Color color;
  ContourPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()
      ..color = color
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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class PatternPainter extends CustomPainter {
  final Color color;

  PatternPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    var patternPaint = Paint()..color = color;
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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class EyesPainter extends CustomPainter {
  final Color rightIrisColor;
  final Color leftIrisColor;

  EyesPainter({required this.rightIrisColor, required this.leftIrisColor});

  @override
  void paint(Canvas canvas, Size size) {
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
      ..color = rightIrisColor
      ..style = PaintingStyle.fill;

    var leftEyeFillPaints = Paint()
      ..color = leftIrisColor
      ..style = PaintingStyle.fill;

    final Path rightEyePath = Path();
    final Path leftEyePath = Path();

    final double width = size.width;
    final double height = size.height;

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

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MouthPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var strokePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = size.width * 0.005
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double width = size.width;
    final double height = size.height;

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
        width * 0.5, height * 0.52, width * 0.53, height * 0.5);
    canvas.drawPath(mouthPath, strokePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BeardPainter extends CustomPainter {
  final Color color;

  BeardPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var beardPaint = Paint()
      ..color = color
      ..strokeWidth = size.width * 0.0025
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
      var leftBeardPath = Path();

      rightBeardPath.moveTo(
        size.width * (rightXStartPoints[i] - horizontalOffset),
        size.height * (rightYStartPoints[i] + verticalOffset),
      );
      rightBeardPath.lineTo(
        size.width * (rightXEndPoints[i] - horizontalOffset),
        size.height * (rightYEndPoints[i] + verticalOffset),
      );
      canvas.drawPath(rightBeardPath, beardPaint);

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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NosePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var nosePaint = Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final double width = size.width;
    final double height = size.height;

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

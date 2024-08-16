import 'package:design_on_dart/designs/top/provider/image_size_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cloud extends ConsumerWidget {
  const Cloud({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = ref.watch(imageSizeProvider);
    return Stack(children: [
      Center(
          child: Stack(children: [
        CloudBump(size: size, width: 1, height: 0.3, topPadding: 0.35),
        CloudBump(size: size, width: 0.3, height: 0.35, leftPadding: 0.125),
        CloudBump(size: size, width: 0.4, height: 0.65, leftPadding: 0.375),
        CloudBump(size: size, width: 0.3, height: 0.3, leftPadding: 0.65),
      ]))
    ]);
  }
}

class CloudBump extends StatelessWidget {
  const CloudBump(
      {super.key,
      required this.size,
      required this.width,
      required this.height,
      this.topPadding = 0,
      this.leftPadding = 0});

  final double size, width, height, topPadding, leftPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(top: size * topPadding, left: size * leftPadding),
        child: Align(
            alignment: Alignment.centerLeft,
            child: ClipPath(
              clipper: RoundedSideClipper(
                  width: size * width, height: size * height),
              child: Container(
                  width: size * width,
                  height: size * height,
                  color: Colors.white),
            )));
  }
}

class RoundedSideClipper extends CustomClipper<Path> {
  final double width;
  final double height;

  RoundedSideClipper({required this.width, required this.height});

  @override
  Path getClip(Size size) {
    final path = Path();
    double radius = width < height ? width / 2 : height / 2;

    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.lineTo(width - radius, 0);
    path.quadraticBezierTo(width, 0, width, radius);
    path.lineTo(width, height - radius);
    path.quadraticBezierTo(width, height, width - radius, height);
    path.lineTo(radius, height);
    path.quadraticBezierTo(0, height, 0, height - radius);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

import 'package:design_on_dart/designs/cat/cat.dart';
import 'package:design_on_dart/designs/cat/provider/random_color_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorCat extends ConsumerWidget {
  const ColorCat({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ランダムな色を生成する
    final randomColor = ref.read(randomColorProvider.notifier);
    final Color baseColor = randomColor.getRandomColor();
    final Color patternColor = randomColor.getRandomColor();
    final Color rightIrisColor = randomColor.getRandomColor();
    final Color leftIrisColor = randomColor.getRandomColor();

    return CustomPaint(
      painter: CatPainter(
        baseColor: baseColor,
        patternColor: patternColor,
        rightIrisColor: rightIrisColor,
        leftIrisColor: leftIrisColor,
      ),
    );
  }
}

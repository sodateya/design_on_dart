import 'package:design_on_dart/designs/cat/color_cat.dart';
import 'package:design_on_dart/designs/top/component/design_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManyCatPage extends ConsumerWidget {
  const ManyCatPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: DesignFrame(
        designWidget: Wrap(
          alignment: WrapAlignment.center,
          children: List.generate(
            2000, // 生成するCatウィジェットの数
            (index) => const SizedBox(
              width: 300,
              height: 300,
              child: ColorCat(),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:design_on_dart/designs/cat/color_cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManyCatPage extends ConsumerWidget {
  const ManyCatPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: List.generate(
                  200, // 生成するCatウィジェットの数
                  (index) => const SizedBox(
                    width: 150,
                    height: 150,
                    child: ColorCat(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

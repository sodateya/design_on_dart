import 'package:design_on_dart/designs/top/provider/capture_key_provider.dart';
import 'package:design_on_dart/designs/top/provider/capture_png_provider.dart';
import 'package:design_on_dart/designs/top/provider/image_size_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DesignFrame extends ConsumerWidget {
  const DesignFrame({super.key, required this.designWidget});
  final Widget designWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final globalKey = ref.watch(captureKeyProvider);
    final imageSize = ref.watch(imageSizeProvider);
    return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(imageSize.toString()),
                Center(
                  child: RepaintBoundary(
                      key: globalKey,
                      child: Container(
                          color: Colors.transparent,
                          child: Stack(
                            children: [
                              SizedBox(
                                  width: imageSize,
                                  height: imageSize,
                                  child: designWidget),
                            ],
                          ))),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: '-',
              onPressed: () {
                final notifier = ref.read(imageSizeProvider.notifier);
                notifier.remove();
              },
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              heroTag: '+',
              onPressed: () {
                final notifier = ref.read(imageSizeProvider.notifier);
                notifier.add();
              },
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: '4500',
              onPressed: () {
                final notifier = ref.read(imageSizeProvider.notifier);
                notifier.resize4500();
              },
              child: const Text('4500'),
            ),
            FloatingActionButton(
              heroTag: '1000',
              onPressed: () {
                final notifier = ref.read(imageSizeProvider.notifier);
                notifier.resize1000();
              },
              child: const Text('100'),
            ),
            FloatingActionButton(
              heroTag: 'capture',
              onPressed: () {
                ref.read(capturePngProvider.notifier).capturePng(globalKey);
              },
              tooltip: 'Capture PNG',
              child: const Icon(Icons.camera),
            ),
          ],
        ));
  }
}

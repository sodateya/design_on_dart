import 'package:design_on_dart/designs/sun/sun.dart';
import 'package:design_on_dart/designs/sun/sun_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopScreen extends ConsumerWidget {
  const TopScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final globalKey = ref.watch(sunGlobalKeyProvider);

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: RepaintBoundary(
                key: globalKey,
                child: Container(
                    color: Colors.transparent,
                    child: const Stack(
                      children: [
                        SizedBox(width: 4500, height: 4500, child: Sun()),
                      ],
                    ))),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final globalKey = ref.read(sunGlobalKeyProvider);
          ref.read(sunProviderProvider.notifier).capturePng(globalKey);
        },
        tooltip: 'Capture PNG',
        child: const Icon(Icons.camera),
      ),
    );
  }
}

import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sun_provider.g.dart';

@riverpod
class SunProvider extends _$SunProvider {
  @override
  build() {
    return '';
  }

  Future<void> capturePng(globalKey) async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final blob = html.Blob([pngBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "image.png")
        ..click();
      html.Url.revokeObjectUrl(url);
    } catch (e) {
      print(e);
    }
  }
}

@riverpod
GlobalKey sunGlobalKey(SunGlobalKeyRef ref) {
  final GlobalKey globalKey = GlobalKey();
  return globalKey;
}

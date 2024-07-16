import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'capture_key_provider.g.dart';

@riverpod
GlobalKey captureKey(CaptureKeyRef ref) {
  final GlobalKey globalKey = GlobalKey();
  return globalKey;
}

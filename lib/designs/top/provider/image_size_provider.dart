import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_size_provider.g.dart';

@riverpod
class ImageSize extends _$ImageSize {
  @override
  double build() {
    return 200;
  }

  void add() {
    final value = state + 100;
    state = value;
  }

  void remove() {
    final value = state - 100;
    state = value;
  }

  void resize4500() {
    state = 4500;
  }

  void resize1000() {
    state = 1000;
  }
}

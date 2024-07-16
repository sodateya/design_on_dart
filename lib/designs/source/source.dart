import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/dracula.dart';

class SourceCodeWidget extends StatelessWidget {
  final String sourceCode;

  const SourceCodeWidget({super.key, required this.sourceCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Source Code Viewer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: HighlightView(
            sourceCode,
            language: 'dart',
            theme: draculaTheme,
            padding: const EdgeInsets.all(12),
            textStyle: const TextStyle(
              fontFamily: 'Courier',
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

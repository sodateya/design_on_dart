import 'package:design_on_dart/designs/top/component/design_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoDesignButton extends ConsumerWidget {
  const GoDesignButton(
      {super.key, required this.designName, required this.imageWidget});
  final String designName;

  final Widget imageWidget;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DesignFrame(
              designWidget: imageWidget,
            );
          }));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.blueAccent),
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Go $designName Page',
                style: const TextStyle(fontSize: 36),
              ),
              SizedBox(width: 200, height: 200, child: imageWidget)
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:design_on_dart/designs/cat/cat.dart';
import 'package:design_on_dart/designs/cloud/cloud.dart';
import 'package:design_on_dart/designs/sun/sun.dart';
import 'package:design_on_dart/designs/top/component/go_design_button.dart';
import 'package:design_on_dart/designs/top/component/many_cat_button.dart';
import 'package:flutter/material.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            GoDesignButton(
              designName: 'Sun',
              imageWidget: Sun(),
            ),
            GoDesignButton(
              designName: 'Cat',
              imageWidget: Cat(),
            ),
            GoDesignButton(
              designName: 'Cloud',
              imageWidget: Cloud(),
            ),
            ManyCatButton()
          ],
        ),
      ),
    );
  }
}

import 'package:design_on_dart/designs/cat/color_cat.dart';
import 'package:design_on_dart/designs/cat/many_cat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManyCatButton extends ConsumerWidget {
  const ManyCatButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ManyCatPage();
          }));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.blueAccent),
          width: 300,
          height: 300,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Go Many Cat Page',
                style: TextStyle(fontSize: 36),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 80, height: 80, child: ColorCat()),
                  SizedBox(width: 80, height: 80, child: ColorCat()),
                  SizedBox(width: 80, height: 80, child: ColorCat())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

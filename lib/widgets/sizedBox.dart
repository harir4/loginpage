import 'package:flutter/material.dart';

class Sizbox extends StatelessWidget {
   Sizbox({super.key,required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

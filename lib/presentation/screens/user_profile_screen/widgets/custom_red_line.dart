import 'package:flutter/material.dart';

class CustomRedLine extends StatelessWidget {
  final double height;
  final double width;

  const CustomRedLine({
    super.key,
    this.height = 20.0,
    this.width = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.red,
    );
  }
}

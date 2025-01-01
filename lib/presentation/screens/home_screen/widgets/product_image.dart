import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.imageLink});

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 120,
      child: ClipRRect(
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(24),
        ),
        child: Image.network(
          imageLink,
          fit: BoxFit.fill,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

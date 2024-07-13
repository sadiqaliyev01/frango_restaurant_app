import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_paddings.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: GestureDetector(
        onTap: () {},
        child: Image.asset(
          "assets/png/person_pp.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

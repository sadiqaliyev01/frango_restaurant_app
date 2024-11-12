import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class ListTileItems extends StatelessWidget {
  const ListTileItems({super.key, this.text, this.onTap, this.icon});

  final Widget? text;
  final void Function()? onTap;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: Material(
        color: AppColors.primaryYellow,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          splashColor: AppColors.primaryBlack.withOpacity(0.2),
          highlightColor: AppColors.primaryBlack.withOpacity(0.1),
          child: ListTile(
            leading: icon,
            textColor: AppColors.primaryBlack,
            title: text,
          ),
        ),
      ),
    );
  }
}

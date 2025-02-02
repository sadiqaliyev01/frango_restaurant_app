import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class ConfirmationAnimation extends StatefulWidget {
  const ConfirmationAnimation({super.key});

  @override
  _ConfirmationAnimationState createState() => _ConfirmationAnimationState();
}

class _ConfirmationAnimationState extends State<ConfirmationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: false);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 3.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.4, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              width: 115 * _scaleAnimation.value,
              height: 115 * _scaleAnimation.value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryYellow
                    .withOpacity(_opacityAnimation.value),
              ),
            );
          },
        ),
        const Icon(Icons.check_circle,
            color: AppColors.primaryYellow, size: 80),
      ],
    );
  }
}

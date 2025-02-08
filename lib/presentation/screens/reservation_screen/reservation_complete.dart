import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/presentation/screens/reservation_screen/widgets/confirmation_animation.dart';
import 'package:frango_restaurant_app/utils/helpers/pager.dart';

class ReservationComplete extends StatelessWidget {
  const ReservationComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBlack,
        body: Column(
          children: [
            const Spacer(),
            const SizedBox(
              height: 120,
              child: ConfirmationAnimation(),
            ),
            const SizedBox(height: 24),
            const Text(
              "Rezervasiya uğurla qeydə alındı!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryYellow,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Rezervasiyanızı dəyişmək və ya silmək istəsəniz,\n istifadəçi profilinə daxil olun.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryYellow,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Pager.home(context),
                    ),
                    (route) => false,
                  );
                },
                child: const Text(
                  "Əsas səhifəyə keç",
                  style: TextStyle(fontSize: 16, color: AppColors.primaryBlack),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

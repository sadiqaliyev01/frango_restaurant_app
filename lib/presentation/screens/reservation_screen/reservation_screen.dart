import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/data/models/local/table_model.dart';
import 'package:frango_restaurant_app/presentation/screens/reservation_screen/reservation_complete.dart';
import 'package:frango_restaurant_app/presentation/screens/reservation_screen/widgets/reserv_details.dart';

class ReservationScreen extends StatelessWidget {
  final TableModel? table;

  const ReservationScreen({
    super.key,
    this.table,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlack,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.primaryYellow),
        ),
        titleSpacing: 90,
        title: const Text(
          'Rezervasiya',
          style: TextStyle(color: AppColors.lightGray),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          if (table != null)
            Text(
              'Seçilən masa: ${table!.tableNo}',
              style: const TextStyle(
                color: AppColors.lightGray,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (table == null)
            const Text(
              'Masa seçilmədi',
              style: TextStyle(
                color: AppColors.lightGray,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: ReservDetails(),
          ),
          Expanded(child: Container()),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryYellow,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => const ReservationComplete(),
              ),
              (route) => false,
            );
          },
          child: const Text(
            'Rezervi tamamla',
            style: TextStyle(
              color: AppColors.primaryBlack,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

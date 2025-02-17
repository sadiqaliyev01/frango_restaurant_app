import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/reservation/reservation_cubit.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/presentation/screens/reservation_screen/reservation_complete.dart';
import 'package:frango_restaurant_app/presentation/screens/reservation_screen/widgets/reserv_details.dart';

import '../../../cubits/table/table_cubit.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reservationCubit = context.read<ReservationCubit>();

    // ✅ Load user ID when screen opens
    reservationCubit.loadUserId();

    return BlocListener<TableCubit, TableState>(
      listener: (context, state) {
        if (state is TableSelected) {
          reservationCubit.tableIdController.text =
              state.selectedTable.id ?? '';
          reservationCubit.peopleCountController.text =
              state.selectedTable.capacity?.toString() ?? '';
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryBlack,
        appBar: AppBar(
          backgroundColor: AppColors.primaryBlack,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios,
                color: AppColors.primaryYellow),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ReservDetails(
                onDateSelected: (date) {
                  reservationCubit.updateArrivalTime(date, TimeOfDay.now());
                },
                onTimeSelected: (time) {
                  reservationCubit.updateArrivalTime(DateTime.now(), time);
                },
              ),
            ),
            const SizedBox(height: 16),

            /// ✅ **New Note Input Field**
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                controller: reservationCubit.noteController,
                decoration: InputDecoration(
                  hintText: "Qeyd əlavə edin",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: AppColors.buttonAndTextFieldGray,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                maxLines: 3,
                style: const TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 16),
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
            onPressed: () async {
              await reservationCubit.postReservation();
              if (context.read<ReservationCubit>().state
                  is ReservationSuccess) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const ReservationComplete(isReservation: false),
                  ),
                  (route) => false,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content:
                          Text("Reservation failed! Check required fields.")),
                );
              }
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
      ),
    );
  }
}

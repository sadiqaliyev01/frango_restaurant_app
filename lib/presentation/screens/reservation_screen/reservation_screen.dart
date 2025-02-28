import 'package:flutter/material.dart';
import '../../../cubits/table/table_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/reservation/reservation_cubit.dart';
import 'package:frango_restaurant_app/presentation/screens/reservation_screen/reservation_complete.dart';
import 'package:frango_restaurant_app/presentation/screens/reservation_screen/widgets/reserv_details.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reservationCubit = context.read<ReservationCubit>();
    reservationCubit.loadUserId();

    final theme = Theme.of(context);
    final isLightMode = theme.brightness == Brightness.light;

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
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: theme.appBarTheme.backgroundColor,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: theme.appBarTheme.iconTheme?.color,
            ),
          ),
          titleSpacing: 90,
          title: Text(
            'Rezervasiya',
            style: theme.appBarTheme.titleTextStyle,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                controller: reservationCubit.noteController,
                decoration: InputDecoration(
                  hintText: "Qeyd əlavə edin",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                maxLines: 3,
                style: TextStyle(
                  color: isLightMode ? Colors.black : Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed: () async {
              // await reservationCubit.postReservation();
              // if (context.read<ReservationCubit>().state
              //     is ReservationSuccess) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const ReservationComplete(isReservation: false),
                ),
                (route) => false,
              );
              // } else {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(
              //       content: Text("Reservation failed! Check required fields."),
              //     ),
              //   );
              // }
            },
            child: Text(
              'Rezervi tamamla',
              style: theme.textTheme.labelLarge?.copyWith(
                color: isLightMode ? Colors.black : Colors.white,
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

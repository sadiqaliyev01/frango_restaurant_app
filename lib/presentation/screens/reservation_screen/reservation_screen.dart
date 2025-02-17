import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/reservation/reservation_cubit.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/data/models/local/table_model.dart';
import 'package:frango_restaurant_app/presentation/screens/reservation_screen/reservation_complete.dart';
import 'package:frango_restaurant_app/presentation/screens/reservation_screen/widgets/reserv_details.dart';

import '../../../cubits/table/table_cubit.dart';

class ReservationScreen extends StatelessWidget {
  final TableModel? table;

  const ReservationScreen({
    super.key,
    this.table,
  });

  @override
  Widget build(BuildContext context) {

    final tableCubit = context.watch<TableCubit>();

    final reservationCubit = context.read<ReservationCubit>();

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
        body: BlocBuilder<TableCubit, TableState>(
          builder: (context, state) {
            final tableCubit = context.read<TableCubit>();

            final reservationCubit = context.read<ReservationCubit>();

            if (tableCubit.selectedTable == null) {
              return const Center(
                child: Text(
                  "Masa seçilmədi",
                  style: TextStyle(color: AppColors.primaryYellow),
                ),
              );
            }

            return Column(
              children: [
                const SizedBox(height: 16),
                Text(
                  'Seçilən masa: ${tableCubit.selectedTable!.no}',
                  style: const TextStyle(
                    color: AppColors.lightGray,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Maksimum tutum: ${tableCubit.selectedTable!.capacity} nəfər',
                  style: const TextStyle(
                    color: AppColors.lightGray,
                    fontSize: 16,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: ReservDetails(),
                ),
                Expanded(child: Container()),
              ],
            );
          },
        ),
        // body: Column(
        //   children: [
        //     const SizedBox(height: 16),
        //     Text(
        //       'Seçilən masa: ${tableCubit.selectedTable!.no}',
        //       style: const TextStyle(
        //         color: AppColors.lightGray,
        //         fontSize: 18,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //     Text(
        //       'Maksimum tutum: ${tableCubit.selectedTable!.capacity} nəfər',
        //       style: const TextStyle(
        //         color: AppColors.lightGray,
        //         fontSize: 16,
        //       ),
        //     ),
        //     // if (table != null)
        //     //   Text(
        //     //     'Seçilən masa: ${table!.tableNo}',
        //     //     style: const TextStyle(
        //     //       color: AppColors.lightGray,
        //     //       fontSize: 18,
        //     //       fontWeight: FontWeight.bold,
        //     //     ),
        //     //   ),
        //     // if (table == null)
        //     //   const Text(
        //     //     'Masa seçilmədi',
        //     //     style: TextStyle(
        //     //       color: AppColors.lightGray,
        //     //       fontSize: 18,
        //     //       fontWeight: FontWeight.bold,
        //     //     ),
        //     //   ),
        //     const Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 12.0),
        //       child: ReservDetails(),
        //     ),
        //     Expanded(child: Container()),
        //   ],
        // ),
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
      ),
    );
  }
}

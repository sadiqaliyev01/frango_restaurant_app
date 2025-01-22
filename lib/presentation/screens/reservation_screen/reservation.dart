import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/di/locator.dart';
import 'package:frango_restaurant_app/data/models/remote/reservation_response.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/reservation_services.dart';
import 'package:frango_restaurant_app/presentation/screens/reservation_screen/widgets/reservation_table_card.dart';

class ReservationListScreen extends StatefulWidget {
  const ReservationListScreen({super.key});

  @override
  State<ReservationListScreen> createState() => _ReservationListScreenState();
}

class _ReservationListScreenState extends State<ReservationListScreen> {
  final reservationService = locator<ReservationService>();
  late Future<List<ReservationResponse>> reservationsFuture;

  @override
  void initState() {
    super.initState();
    reservationsFuture = reservationService.getReservations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reservations")),
      body: FutureBuilder<List<ReservationResponse>>(
        future: reservationsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No reservations found."));
          }

          final reservations = snapshot.data!;
          return ListView.builder(
            itemCount: reservations.length,
            itemBuilder: (context, index) {
              final reservation = reservations[index];
              return ReservationCard(
                tableNo: reservation.table.no,
                floor: reservation.table.floor,
                capacity: reservation.table.capacity,
                cigarette: reservation.table.cigarette,
                windowView: reservation.table.windowView,
                userName:
                    "${reservation.user.name} ${reservation.user.surname}",
                userEmail: reservation.user.email,
                note: reservation.note,
                peopleCount: reservation.peopleCount,
                arrivalTime: reservation.arrivalTime,
                leavingTime: reservation.leavingTime,
              );
            },
          );
        },
      ),
    );
  }
}

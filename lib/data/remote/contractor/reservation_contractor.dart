import 'package:frango_restaurant_app/data/models/remote/reservation_response.dart';

abstract class ReservationContractor {
  Future<List<ReservationResponse>> postReservation({
    required String tableId,
    required String userId,
    required String note,
    required int peopleCount,
    required DateTime arrivalTime,
    required DateTime leavingTime,
  });
  // Future<ReservationResponse> getReservationById(String id);
  // Future<ReservationResponse> createReservation();
  // Future<ReservationResponse> deleteReservation(String id);
}

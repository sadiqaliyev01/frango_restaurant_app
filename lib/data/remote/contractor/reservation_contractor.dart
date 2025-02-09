abstract class ReservationContractor {
  Future<bool> postReservation({
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

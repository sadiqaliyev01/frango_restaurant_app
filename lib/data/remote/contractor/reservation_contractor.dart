import 'package:frango_restaurant_app/data/models/remote/reservation_response.dart';

abstract class ReservationContractor {
  Future<ReservationResponse> getReservations();
  Future<ReservationResponse> getReservationById(String id);
  Future<ReservationResponse> createReservation();
  Future<ReservationResponse> deleteReservation(String id);
}

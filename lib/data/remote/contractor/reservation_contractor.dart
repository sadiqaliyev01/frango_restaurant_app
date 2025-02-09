import 'package:frango_restaurant_app/data/models/remote/reservation_request_model.dart';

abstract class ReservationContractor {
  Future<ReservationRequestModel> postReservation(
      {required ReservationRequestModel postReservation});
  // Future<ReservationResponse> getReservationById(String id);
  // Future<ReservationResponse> createReservation();
  // Future<ReservationResponse> deleteReservation(String id);
}

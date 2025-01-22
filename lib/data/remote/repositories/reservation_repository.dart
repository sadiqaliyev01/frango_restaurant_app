import 'package:frango_restaurant_app/data/models/remote/reservation_response.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/reservation_services.dart';

class ReservationRepository {
  final ReservationService _service;

  ReservationRepository(this._service);

  Future<List<ReservationResponse>> getAllReservations() {
    return _service.getReservations();
  }
}

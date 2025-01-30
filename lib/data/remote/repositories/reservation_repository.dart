import 'package:frango_restaurant_app/data/models/remote/reservation_request_model.dart';
import 'package:frango_restaurant_app/data/remote/contractor/reservation_contractor.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/reservation_services.dart';

class ReservationRepository implements ReservationContractor {
  final ReservationService _reservationService;

  ReservationRepository(this._reservationService);

  @override
  Future<List<ReservationRequestModel>> postReservation(
          {required ReservationRequestModel postReservation}) =>
      _reservationService.postReservation(postReservation:postReservation);
}

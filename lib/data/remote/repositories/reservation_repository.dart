import 'package:frango_restaurant_app/data/models/remote/reservation_response.dart';
import 'package:frango_restaurant_app/data/remote/contractor/reservation_contractor.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/reservation_services.dart';

class ReservationRepository implements ReservationContractor {
  final ReservationService _reservationService;

  ReservationRepository(this._reservationService);

  @override
  Future<List<ReservationResponse>> postReservation({
    required String tableId,
    required String userId,
    required String note,
    required int peopleCount,
    required DateTime arrivalTime,
    required DateTime leavingTime,
  }) =>
      _reservationService.postReservation(
          tableId: tableId,
          userId: userId,
          note: note,
          peopleCount: peopleCount,
          arrivalTime: arrivalTime,
          leavingTime: leavingTime);
}

import 'package:dio/dio.dart';
import 'package:frango_restaurant_app/data/remote/repositories/reservation_repository.dart';

class ReservationService {
  final Dio _dio;

  ReservationService(this._dio);

  Future<List<Reservation>> getReservations() async {
    try {
      final response = await _dio.get('/reservation');
      return (response.data as List)
          .map((json) => Reservation.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch reservations: $e");
    }
  }
}

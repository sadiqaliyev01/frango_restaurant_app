import 'package:dio/dio.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/status_code.dart';
import 'package:frango_restaurant_app/data/models/remote/reservation_response.dart';

class ReservationService {
  final Dio _dio;
  final String _endpoint = '/reservations';

  ReservationService(this._dio);

  Future<List<ReservationResponse>> getReservations() async {
    try {
      final response = await _dio.get(_endpoint);
      if (response.statusCode!.isSuccess) {
        final List<dynamic> data = response.data;
        return data.map((json) => ReservationResponse.fromJson(json)).toList();
      } else if (response.statusCode.isFailure) {
        throw Exception("Failed to fetch reservations: ${response.statusCode}");
      }
      throw Exception("Unexpected error occurred");
    } catch (e) {
      throw Exception("Error fetching reservations: $e");
    }
  }
}

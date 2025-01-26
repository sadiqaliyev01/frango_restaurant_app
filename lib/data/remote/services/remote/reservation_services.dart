import 'dart:developer';

import 'package:frango_restaurant_app/utils/constants/endpoints.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/status_code.dart';
import 'package:frango_restaurant_app/data/models/remote/reservation_response.dart';
import 'package:frango_restaurant_app/utils/network/dio/dio_client.dart';

class ReservationService {
  final endpoint = Endpoints.reservation;

  Future<List<ReservationResponse>> postReservation({
    required String tableId,
    required String userId,
    required String note,
    required int peopleCount,
    required DateTime arrivalTime,
    required DateTime leavingTime,
  }) async {
    try {
      final requestBody = {
        'tableId': tableId,
        'userId': userId,
        'note': note,
        'peopleCount': peopleCount,
        'arrivalTime': arrivalTime, // arrivalTime.toIso8601String()
        'leavingTime': leavingTime, // leavingTime.toIso8601String()
      };

      log("Reservation Request Body: ${requestBody.toString()}");

      final response = await clientDio.post(
        endpoint,
        data: requestBody,
      );

      log("Reservation Response Body: ${response.toString()}");

      if (response.statusCode!.isSuccess) {
        final List<dynamic> data = response.data;

        log("Reservation Data: ${data.toString()}");

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

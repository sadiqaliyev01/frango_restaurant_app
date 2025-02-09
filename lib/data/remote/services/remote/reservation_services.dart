import 'dart:developer';

import 'package:frango_restaurant_app/utils/constants/endpoints.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/status_code.dart';
import 'package:frango_restaurant_app/data/models/remote/reservation_request_model.dart';
import 'package:frango_restaurant_app/utils/network/dio/dio_client.dart';

class ReservationService {
  final endpoint = Endpoints.reservation;

  Future<ReservationRequestModel> postReservation(
      {required ReservationRequestModel postReservation}) async {
    try {
      log("Reservation Request Body: ${postReservation.toString()}");

      final response = await clientDio.post(
        endpoint,
        data: postReservation.toJson(),
      );

      log("Reservation Response Body: ${response.toString()}");

      if (response.statusCode!.isSuccess) {
        final List<dynamic> data = response.data;

        log("Reservation Data: ${data.toString()}");

        return ReservationRequestModel.fromJson(response.data);
      } else if (response.statusCode.isFailure) {
        throw Exception("Failed to fetch reservations: ${response.statusCode}");
      }
      throw Exception("Unexpected error occurred");
    } catch (e) {
      throw Exception("Error fetching reservations: $e");
    }
  }
}

import 'dart:developer';

import 'package:frango_restaurant_app/utils/constants/endpoints.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/status_code.dart';
import 'package:frango_restaurant_app/utils/network/dio/dio_client.dart';

class ReservationService {
  Future<bool> postReservation({
    required String tableId,
    required String userId,
    required String note,
    required int peopleCount,
    required DateTime arrivalTime,
    required DateTime leavingTime,
  }) async {
    const endpoint = Endpoints.reservation;
    log("Reservation endpoint: $endpoint");
    final requestBody = {
      'table_id': tableId,
      'user_id': userId,
      'note': note,
      'people_count': peopleCount,
      'arrival_time': arrivalTime.toUtc().millisecondsSinceEpoch.toString(),
      'leaving_time': leavingTime.toUtc().millisecondsSinceEpoch.toString(),
    };
    log("Reservation Request Body: ${requestBody.toString()}");
    final response = await clientDio.post(
      endpoint,
      data: requestBody,
    );
    log("Reservation Response Body: ${response.data}");
    log("Reservation Status Code: ${response.statusCode}");

    return response.statusCode!.isSuccess;
  }

  // Future<ReservationRequestModel> postReservation(
  //     {required ReservationRequestModel postReservation}) async {
  //   try {
  //     log("Reservation Request Body: ${postReservation.toString()}");

  //     final response = await clientDio.post(
  //       endpoint,
  //       data: postReservation.toJson(),
  //     );

  //     log("Reservation Response Body: ${response.toString()}");

  //     if (response.statusCode!.isSuccess) {
  //       final List<dynamic> data = response.data;

  //       log("Reservation Data: ${data.toString()}");

  //       return ReservationRequestModel.fromJson(response.data);
  //     } else if (response.statusCode.isFailure) {
  //       throw Exception("Failed to fetch reservations: ${response.statusCode}");
  //     }
  //     throw Exception("Unexpected error occurred");
  //   } catch (e) {
  //     throw Exception("Error fetching reservations: $e");
  //   }
  // }
}

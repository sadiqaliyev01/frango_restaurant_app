// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:frango_restaurant_app/data/models/remote/reservation_request_model.dart';

// import 'package:frango_restaurant_app/data/models/remote/table_response.dart';
// import 'package:frango_restaurant_app/data/remote/contractor/reservation_contractor.dart';

// part 'reservation_state.dart';

// class ReservationCubit extends Cubit<ReservationState> {
//   ReservationCubit(this._reservationContractor) : super(ReservationInitial());

//   final tableIdController = TextEditingController();
//   final userIdController = TextEditingController();
//   final noteController = TextEditingController();
//   final peopleCountController = TextEditingController();
//   final arrivalTimeController = TextEditingController();
//   final leavingTimeController = TextEditingController();

//   String tableId = "";

//   final ReservationContractor _reservationContractor;

//   void autoFillFromTable(TableResponse table) {
//     tableIdController.text = table.id ?? '';
//     peopleCountController.text = table.capacity?.toString() ?? '';
//     emit(ReservationUpdated(table.id ?? '', table.capacity ?? 0));
//   }

//   void postReservation() async {
//     try {
//       emit(ReservationLoading());
//       await _reservationContractor.postReservation(
//         tableId: tableIdController.text,
//         userId: userIdController.text,
//         note: noteController.text,
//         peopleCount: int.parse(peopleCountController.text),
//         arrivalTime: DateTime.parse(arrivalTimeController.text),
//         leavingTime: DateTime.parse(leavingTimeController.text),
//       );
//       emit(ReservationSuccess());
//     } catch (e) {
//       emit(ReservationFailure(e.toString()));
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:frango_restaurant_app/data/models/remote/table_response.dart';
// import 'package:frango_restaurant_app/data/remote/contractor/reservation_contractor.dart';

// part 'reservation_state.dart';

// class ReservationCubit extends Cubit<ReservationState> {
//   ReservationCubit(this._reservationContractor) : super(ReservationInitial());

//   final tableIdController = TextEditingController();
//   final userIdController = TextEditingController();
//   final noteController = TextEditingController();
//   final peopleCountController = TextEditingController();
//   final arrivalTimeController = TextEditingController();
//   final leavingTimeController = TextEditingController();

//   String tableId = "";

//   final ReservationContractor _reservationContractor;

//   void autoFillFromTable(TableResponse table) {
//     tableIdController.text = table.id ?? '';
//     peopleCountController.text = table.capacity?.toString() ?? '';
//     emit(ReservationUpdated(table.id ?? '', table.capacity ?? 0));
//   }

//   void updateArrivalTime(DateTime date, TimeOfDay time) {
//     final DateTime fullDateTime = DateTime(
//       date.year,
//       date.month,
//       date.day,
//       time.hour,
//       time.minute,
//     );

//     arrivalTimeController.text = fullDateTime.toIso8601String(); // ✅ Store as ISO String
//     emit(ReservationUpdated(tableId, int.tryParse(peopleCountController.text) ?? 0));
//   }

//   void postReservation() async {
//     try {
//       emit(ReservationLoading());
//       await _reservationContractor.postReservation(
//         tableId: tableIdController.text,
//         userId: userIdController.text,
//         note: noteController.text,
//         peopleCount: int.parse(peopleCountController.text),
//         arrivalTime: DateTime.parse(arrivalTimeController.text),
//         leavingTime: DateTime.parse(leavingTimeController.text),
//       );
//       emit(ReservationSuccess());
//     } catch (e) {
//       emit(ReservationFailure(e.toString()));
//     }
//   }
// }

// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:frango_restaurant_app/data/models/remote/table_response.dart';
// import 'package:frango_restaurant_app/data/remote/contractor/reservation_contractor.dart';

// part 'reservation_state.dart';

// class ReservationCubit extends Cubit<ReservationState> {
//   ReservationCubit(this._reservationContractor) : super(ReservationInitial());

//   final tableIdController = TextEditingController();
//   final userIdController = TextEditingController();
//   final noteController = TextEditingController();
//   final peopleCountController = TextEditingController();
//   final arrivalTimeController = TextEditingController();
//   final leavingTimeController = TextEditingController();

//   final ReservationContractor _reservationContractor;

//   void autoFillFromTable(TableResponse table) {
//     tableIdController.text = table.id ?? '';
//     peopleCountController.text = table.capacity?.toString() ?? '';
//     emit(ReservationUpdated(table.id ?? '', table.capacity ?? 0));
//   }

//   /// ✅ **Set Date & Time**
//   void updateArrivalTime(DateTime date, TimeOfDay time) {
//     final DateTime fullDateTime = DateTime(
//       date.year,
//       date.month,
//       date.day,
//       time.hour,
//       time.minute,
//     );

//     arrivalTimeController.text =
//         fullDateTime.toUtc().toIso8601String(); // ✅ Store in ISO 8601 format
//     log("Updated Arrival Time: ${arrivalTimeController.text}");
//   }

//   /// ✅ **Set Leaving Time (Optional)**
//   void updateLeavingTime(DateTime date, TimeOfDay time) {
//     final DateTime fullDateTime = DateTime(
//       date.year,
//       date.month,
//       date.day,
//       time.hour,
//       time.minute,
//     );

//     leavingTimeController.text = fullDateTime.toUtc().toIso8601String();
//     log("Updated Leaving Time: ${leavingTimeController.text}");
//   }

//   /// ✅ **Submit Reservation**
//   Future<void> postReservation() async {
//     try {
//       emit(ReservationLoading());

//       if (tableIdController.text.isEmpty ||
//           userIdController.text.isEmpty ||
//           peopleCountController.text.isEmpty ||
//           arrivalTimeController.text.isEmpty ||
//           leavingTimeController.text.isEmpty) {
//         log("❌ Missing Fields: Cannot proceed");
//         emit(ReservationFailure("Missing required fields"));
//         return;
//       }

//       final int? peopleCount = int.tryParse(peopleCountController.text);
//       if (peopleCount == null || peopleCount <= 0) {
//         log("❌ Invalid people count");
//         emit(ReservationFailure("Invalid number of people"));
//         return;
//       }

//       final bool isSuccess = await _reservationContractor.postReservation(
//         tableId: tableIdController.text,
//         userId: userIdController.text,
//         note: noteController.text,
//         peopleCount: peopleCount,
//         arrivalTime: DateTime.parse(arrivalTimeController.text),
//         leavingTime: DateTime.parse(leavingTimeController.text),
//       );

//       if (isSuccess) {
//         emit(ReservationSuccess());
//         log("✅ Reservation Success");
//       } else {
//         emit(ReservationFailure("Reservation failed"));
//         log("❌ API Error: Reservation failed");
//       }
//     } on DioException catch (e) {
//       log("❌ Dio Exception: ${e.response?.data ?? e.toString()}");
//       emit(
//           ReservationFailure("Dio error: ${e.response?.data ?? e.toString()}"));
//     } catch (e) {
//       log("❌ Unknown Exception: $e");
//       emit(ReservationFailure("Error: $e"));
//     }
//   }
// }

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart'; // ✅ Import Hive for local storage
import 'package:frango_restaurant_app/data/remote/contractor/reservation_contractor.dart';
import 'package:frango_restaurant_app/data/models/remote/table_response.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit(this._reservationContractor) : super(ReservationInitial());

  final tableIdController = TextEditingController();
  final noteController = TextEditingController();
  final peopleCountController = TextEditingController();
  final arrivalTimeController = TextEditingController();
  final leavingTimeController = TextEditingController();

  final ReservationContractor _reservationContractor;
  String userId = "";

  /// ✅ **Load `userId` from Hive storage**
  Future<void> loadUserId() async {
    final box = await Hive.openBox('loginBox');
    userId = box.get('userId', defaultValue: "Unknown");
    log("Loaded User ID: $userId");
  }

  /// ✅ **Auto-fill Table Details**
  void autoFillFromTable(TableResponse table) {
    tableIdController.text = table.id ?? '';
    peopleCountController.text = table.capacity?.toString() ?? '';
    emit(ReservationUpdated(table.id ?? '', table.capacity ?? 0));
  }

  /// ✅ **Set Date & Time**
  void updateArrivalTime(DateTime date, TimeOfDay time) {
    final DateTime fullDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    arrivalTimeController.text = fullDateTime.toUtc().toIso8601String();
    log("Updated Arrival Time: ${arrivalTimeController.text}");
  }

  void updateLeavingTime(DateTime date, TimeOfDay time) {
    final DateTime fullDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    leavingTimeController.text = fullDateTime.toUtc().toIso8601String();
    log("Updated Leaving Time: ${leavingTimeController.text}");
  }

  /// ✅ **Submit Reservation**
  Future<void> postReservation() async {
    try {
      emit(ReservationLoading());

      if (tableIdController.text.isEmpty ||
          userId.isEmpty ||
          peopleCountController.text.isEmpty ||
          arrivalTimeController.text.isEmpty ||
          leavingTimeController.text.isEmpty) {
        log("❌ Missing Fields: Cannot proceed");
        emit(ReservationFailure("Missing required fields"));
        return;
      }

      final int? peopleCount = int.tryParse(peopleCountController.text);
      if (peopleCount == null || peopleCount <= 0) {
        log("❌ Invalid people count");
        emit(ReservationFailure("Invalid number of people"));
        return;
      }

      final bool isSuccess = await _reservationContractor.postReservation(
        tableId: tableIdController.text,
        userId: userId, // ✅ Automatically set userId
        note: noteController.text,
        peopleCount: peopleCount,
        arrivalTime: DateTime.parse(arrivalTimeController.text),
        leavingTime: DateTime.parse(leavingTimeController.text),
      );

      if (isSuccess) {
        emit(ReservationSuccess());
        log("✅ Reservation Success");
      } else {
        emit(ReservationFailure("Reservation failed"));
        log("❌ API Error: Reservation failed");
      }
    } on DioException catch (e) {
      log("❌ Dio Exception: ${e.response?.data ?? e.toString()}");
      emit(
          ReservationFailure("Dio error: ${e.response?.data ?? e.toString()}"));
    } catch (e) {
      log("❌ Unknown Exception: $e");
      emit(ReservationFailure("Error: $e"));
    }
  }
}

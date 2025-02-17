import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frango_restaurant_app/data/models/remote/reservation_request_model.dart';

import 'package:frango_restaurant_app/data/models/remote/table_response.dart';
import 'package:frango_restaurant_app/data/remote/contractor/reservation_contractor.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit(this._reservationContractor) : super(ReservationInitial());

  final tableIdController = TextEditingController();
  final userIdController = TextEditingController();
  final noteController = TextEditingController();
  final peopleCountController = TextEditingController();
  final arrivalTimeController = TextEditingController();
  final leavingTimeController = TextEditingController();

  String tableId = "";

  final ReservationContractor _reservationContractor;

  void autoFillFromTable(TableResponse table) {
    tableIdController.text = table.id ?? '';
    peopleCountController.text = table.capacity?.toString() ?? '';
    emit(ReservationUpdated(table.id ?? '', table.capacity ?? 0));
  }

  void postReservation() async {
    try {
      emit(ReservationLoading());
      await _reservationContractor.postReservation(
        tableId: tableIdController.text,
        userId: userIdController.text,
        note: noteController.text,
        peopleCount: int.parse(peopleCountController.text),
        arrivalTime: DateTime.parse(arrivalTimeController.text),
        leavingTime: DateTime.parse(leavingTimeController.text),
      );
      emit(ReservationSuccess());
    } catch (e) {
      emit(ReservationFailure(e.toString()));
    }
  }
}

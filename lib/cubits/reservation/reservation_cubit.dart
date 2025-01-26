import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  final ReservationContractor _reservationContractor;
  void postReservation() {
    try {
      emit(ReservationLoading());
      _reservationContractor.postReservation(
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

  @override
  Future<void> close() {
    tableIdController.dispose();
    userIdController.dispose();
    noteController.dispose();
    peopleCountController.dispose();
    arrivalTimeController.dispose();
    leavingTimeController.dispose();
    return super.close();
  }
}

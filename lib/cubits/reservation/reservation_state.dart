part of 'reservation_cubit.dart';

@immutable
sealed class ReservationState {}

final class ReservationInitial extends ReservationState {}

final class ReservationLoading extends ReservationState {}

final class ReservationSuccess extends ReservationState {}

class ReservationUpdated extends ReservationState {
  final String tableId;
  final int peopleCount;

  ReservationUpdated(this.tableId, this.peopleCount);
}

final class ReservationFailure extends ReservationState {
  ReservationFailure(this.errorMessage);

  final String errorMessage;
}

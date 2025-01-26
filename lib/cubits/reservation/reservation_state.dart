part of 'reservation_cubit.dart';

@immutable
sealed class ReservationState {}

final class ReservationInitial extends ReservationState {}

final class ReservationLoading extends ReservationState {}

final class ReservationSuccess extends ReservationState {}

final class ReservationFailure extends ReservationState {
  ReservationFailure(this.errorMessage);

  final String errorMessage;
}

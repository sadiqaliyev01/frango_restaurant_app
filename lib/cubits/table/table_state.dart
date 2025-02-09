part of 'table_cubit.dart';

@immutable
sealed class TableState {}

final class TableInitial extends TableState {}

final class TableLoading extends TableState {}

final class TableSuccess extends TableState {
  final List<TableResponse> tables;

  TableSuccess(this.tables);
}

final class TableFailure extends TableState {
  final String error;

  TableFailure(this.error);
}

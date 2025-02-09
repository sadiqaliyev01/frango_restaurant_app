// table_state.dart
part of 'table_cubit.dart';

@immutable
sealed class TableState {}

class TableInitial extends TableState {}

class TableLoading extends TableState {}

class TableSuccess extends TableState {
  final List<TableResponse> tables;
  TableSuccess(this.tables);
}

class TableSelected extends TableState {
  final TableResponse selectedTable;
  TableSelected(this.selectedTable);
}

class TableFailure extends TableState {
  final String error;
  TableFailure(this.error);
}
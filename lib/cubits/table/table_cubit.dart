import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/data/models/remote/table_response.dart';
import 'package:frango_restaurant_app/data/remote/contractor/table_contractor.dart';

part 'table_state.dart';

class TableCubit extends Cubit<TableState> {
  TableCubit(this._tableContractor) : super(TableInitial());

  final TableContractor _tableContractor;

  Future<void> getTable() async {
    try {
      emit(TableLoading());
      log("Table is Loading");

      final tables = await _tableContractor.getTable();

      // ✅ Sorting tables by table number (ascending order)
      tables.sort((a, b) => a.no!.compareTo(b.no!));

      log("Table is success: $tables");
      emit(TableSuccess(tables));
    } on DioException catch (e) {
      log("Dio Exception Error on Table Cubit: $e");
      emit(TableFailure("Dio Exception Error on Table Cubit"));
    } catch (e) {
      log("Unknown Exception Error on Table Cubit: $e");
      emit(TableFailure("Unknown Exception Error on Table Cubit: $e"));
    }
  }
}

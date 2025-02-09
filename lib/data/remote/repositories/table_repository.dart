import 'package:frango_restaurant_app/data/models/remote/table_response.dart';
import 'package:frango_restaurant_app/data/remote/contractor/table_contractor.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/table_service.dart';

class TableRepository implements TableContractor {
  const TableRepository(this._tableService);

  final TableService _tableService;
  
  @override
  Future<List<TableResponse>> getTable() {
    return _tableService.getTable();
  }
}

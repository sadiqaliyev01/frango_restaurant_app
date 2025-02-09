import 'package:frango_restaurant_app/data/models/remote/table_response.dart';

abstract class TableContractor {
  Future<List<TableResponse>> getTable();
}

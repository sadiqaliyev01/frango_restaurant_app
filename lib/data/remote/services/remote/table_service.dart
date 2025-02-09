import 'package:frango_restaurant_app/data/models/remote/table_response.dart';
import 'package:frango_restaurant_app/utils/constants/endpoints.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/status_code.dart';
import 'package:frango_restaurant_app/utils/network/dio/dio_client.dart';

class TableService {
  final endpoint = Endpoints.table;

  Future<List<TableResponse>> getTable() async {
    final response = await clientDio.get(endpoint);
    if (response.statusCode.isSuccess) {
      List<dynamic> data = response.data;
      return data.map((table) => TableResponse.fromJson(table)).toList();
    } else if (response.statusCode.isFailure) {
      throw Exception('Table Service data not found');
    }
    throw Exception('Failed to load Table Service data');
  }
}

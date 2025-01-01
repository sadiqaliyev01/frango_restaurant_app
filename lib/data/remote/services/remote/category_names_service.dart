import 'package:frango_restaurant_app/data/models/remote/category_names_response.dart';
import 'package:frango_restaurant_app/utils/constants/endpoints.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/status_code.dart';

import '../../../../utils/network/dio/dio_client.dart';

class CategoryNamesService {
  final endpoint = Endpoints.categoryNames;

  Future<List<CategoryNamesResponse>> getCategoryNames() async {
    final response = await clientDio.get(endpoint);
    if (response.statusCode.isSuccess) {
      List<dynamic> data = response.data;
      return data.map((meal) => CategoryNamesResponse.fromJson(meal)).toList();
    } else if (response.statusCode.isFailure) {
      throw Exception(
          'Failed to retrieve category names. Status code: ${response.statusCode}');
    } else {
      throw Exception('Failed to retrieve category names. Unknown error');
    }
  }
}

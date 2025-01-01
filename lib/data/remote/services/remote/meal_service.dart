import 'package:frango_restaurant_app/utils/constants/endpoints.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/status_code.dart';
import 'package:frango_restaurant_app/utils/network/dio/dio_client.dart';

import '../../../models/remote/meal_response.dart';

// class MealService{
//   final endpoint = Endpoints.meals;
//
//   Future<MealResponse> getMeals() async{
//     final response = await clientDio.get(endpoint);
//     if (response.statusCode.isSuccess) {
//       return MealResponse.fromJson(response.data);
//     } else if (response.statusCode.isFailure) {
//       throw Exception('Meal Service data not found');
//     }
//     throw Exception('Failed to load Meal Service data');
//   }
// }

class MealService {
  final endpoint = Endpoints.meals;

  Future<List<MealResponse>> getMeals() async {
    final response = await clientDio.get(endpoint);
    if (response.statusCode.isSuccess) {
      // Parse the list of meals
      List<dynamic> data = response.data;
      return data.map((meal) => MealResponse.fromJson(meal)).toList();
    } else if (response.statusCode.isFailure) {
      throw Exception('Meal Service data not found');
    }
    throw Exception('Failed to load Meal Service data');
  }
}

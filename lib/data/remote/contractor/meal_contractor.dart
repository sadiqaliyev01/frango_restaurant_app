import '../../models/remote/meal_response.dart';

abstract class MealContractor{
  Future<List<MealResponse>> getMeals();
}
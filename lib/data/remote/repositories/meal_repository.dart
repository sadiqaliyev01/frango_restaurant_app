import 'package:frango_restaurant_app/data/models/remote/meal_response.dart';
import 'package:frango_restaurant_app/data/remote/contractor/meal_contractor.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/meal_service.dart';

class MealRepository implements MealContractor {
  MealRepository(this._mealService);

  final MealService _mealService;

  @override
  Future<List<MealResponse>> getMeals() {
    return _mealService.getMeals();
  }
  
}

import 'package:frango_restaurant_app/data/models/remote/meal_response.dart';

sealed class MealState {}

final class MealInitial extends MealState {}

final class MealLoading extends MealState {}

class MealSuccess extends MealState {
  final List<Meal> meals; // ✅ Change to List<Meal>
  final List<String> categories;
  final String? selectedCategory;

  MealSuccess(this.meals, this.categories, this.selectedCategory);

}

final class MealFailure extends MealState {
  final String error;

  MealFailure(this.error);
}

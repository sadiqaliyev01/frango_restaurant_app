import 'package:frango_restaurant_app/data/models/remote/meal_response.dart';

sealed class MealState {}

final class MealInitial extends MealState {}

final class MealLoading extends MealState {}

final class MealSuccess extends MealState {
  MealSuccess(this.mealResponse);

  final List<MealResponse> mealResponse;
}

final class MealFailure extends MealState {
  final String error;

  MealFailure(this.error);
}

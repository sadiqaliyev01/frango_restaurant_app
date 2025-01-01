import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/meal/meal_state.dart';
import 'package:frango_restaurant_app/data/remote/contractor/meal_contractor.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit(this._mealContractor) : super(MealInitial());
  final MealContractor _mealContractor;

  Future<void> getMeals() async {
    try {
      emit(MealLoading());
      final meals = await _mealContractor.getMeals(); // This will now be a list
      log("Meals Fetched: $meals");
      emit(MealSuccess(meals)); // Emit the list of meals
      log("Meal Success");
    } catch (e) {
      emit(MealFailure("Meal Failure: ${e.toString()}"));
    }
  }
}

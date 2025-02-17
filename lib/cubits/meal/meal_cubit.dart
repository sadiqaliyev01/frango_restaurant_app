import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/meal/meal_state.dart';
import 'package:frango_restaurant_app/data/remote/contractor/meal_contractor.dart';
import '../../data/models/remote/meal_response.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit(this._mealContractor) : super(MealInitial());

  final MealContractor _mealContractor;
  List<MealResponse> allMeals = [];
  List<Meal> allProducts = []; // ✅ Store all meals for searching
  List<Meal> filteredMeals = [];
  List<String> categories = [];
  String? selectedCategory;

  /// ✅ Fetch all meals & categories
  Future<void> getMeals() async {
    try {
      emit(MealLoading());
      allMeals = await _mealContractor.getMeals();
      categories = extractCategories(allMeals);

      // Store all products from all categories for search
      allProducts = allMeals
          .where(
              (mealResponse) => mealResponse.meal != null) // ✅ Filter non-null
          .expand<Meal>(
              (mealResponse) => mealResponse.meal!) // ✅ Ensure non-null access
          .toList();

      // Default: Show first category meals
      selectedCategory = categories.isNotEmpty ? categories[0] : null;
      filterMealsByCategory(selectedCategory!);

      emit(MealSuccess(filteredMeals, categories, selectedCategory));
      log("Meal Success");
    } catch (e) {
      emit(MealFailure("Meal Failure: ${e.toString()}"));
    }
  }

  /// ✅ Extract Unique Categories
  List<String> extractCategories(List<MealResponse> meals) {
    return meals
        .map((meal) => meal.title)
        .where((title) =>
            title != null &&
            title.isNotEmpty) // ✅ Filter out null & empty titles
        .cast<String>() // ✅ Ensure non-null list
        .toSet()
        .toList();
  }

  /// ✅ Filter Meals by Category
  void filterMealsByCategory(String category) {
    selectedCategory = category;

    final selectedMealResponse = allMeals.firstWhere(
      (mealResponse) => mealResponse.title == category,
      orElse: () => MealResponse(title: category, meal: []),
    );

    filteredMeals =
        selectedMealResponse.meal ?? <Meal>[]; // ✅ Ensure a non-null list
    emit(MealSuccess(filteredMeals, categories, selectedCategory));
  }

  /// ✅ Search by Product Name
  void searchMeals(String query) {
    if (query.isEmpty) {
      filterMealsByCategory(selectedCategory!); // Reset to selected category
    } else {
      filteredMeals = allProducts
          .where(
              (meal) => meal.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(MealSuccess(filteredMeals, categories, selectedCategory));
  }
}

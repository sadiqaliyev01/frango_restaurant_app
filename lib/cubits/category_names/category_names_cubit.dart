import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/category_names/category_names_state.dart';
import 'package:frango_restaurant_app/data/remote/contractor/category_names_contractor.dart';

class CategoryNamesCubit extends Cubit<CategoryNamesState> {
  CategoryNamesCubit(this._categoryNamesContractor)
      : super(CategoryNamesInitial());

  final CategoryNamesContractor _categoryNamesContractor;

  Future<void> getCategoryNames() async {
    try {
      emit(CategoryNamesLoading());
      final categoryNames = await _categoryNamesContractor.getCategoryNames();
      log("CategoryNames fetched: $categoryNames");
      emit(CategoryNamesSuccess(categoryNames));
      log("CategoryNames successfully");
    } catch (e) {
      emit(CategoryNamesFailure("Category Names failed: $e"));
    }
  }
}

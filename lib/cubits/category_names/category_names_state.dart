import 'package:frango_restaurant_app/data/models/remote/category_names_response.dart';

sealed class CategoryNamesState {}

final class CategoryNamesInitial extends CategoryNamesState {}

final class CategoryNamesLoading extends CategoryNamesState {}

final class CategoryNamesSuccess extends CategoryNamesState {
  CategoryNamesSuccess(this.categoryNamesResponse);

  final List<CategoryNamesResponse> categoryNamesResponse;
}

final class CategoryNamesFailure extends CategoryNamesState {
  CategoryNamesFailure(this.error);

  final String error;
}

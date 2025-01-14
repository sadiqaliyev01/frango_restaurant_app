import 'package:frango_restaurant_app/data/models/remote/category_names_response.dart';

abstract class CategoryNamesContractor {
  Future<List<CategoryNamesResponse>> getCategoryNames();
}

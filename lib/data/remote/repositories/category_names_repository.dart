import 'package:frango_restaurant_app/data/models/remote/category_names_response.dart';
import 'package:frango_restaurant_app/data/remote/contractor/category_names_contractor.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/category_names_service.dart';

class CategoryNamesRepository implements CategoryNamesContractor {
  CategoryNamesRepository(this._categoryNamesService);

  final CategoryNamesService _categoryNamesService;

  @override
  Future<List<CategoryNamesResponse>> getCategoryNames() {
    return _categoryNamesService.getCategoryNames();
  }
}

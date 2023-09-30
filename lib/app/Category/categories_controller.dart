import '../api/api_service_controll.dart';
import '../model/category_model.dart';

class CategoriesController {
  Future<List<CategoryModel>> getCategory() async {
    try {
      final categoriesData = await ApiServiceController.fetchMealCategories();

      final categories = categoriesData
          .map((categoryData) => CategoryModel.fromJson(categoryData))
          .toList();

      return categories;
    } catch (error) {
      // ignore: use_rethrow_when_possible
      throw error;
    }
  }
}

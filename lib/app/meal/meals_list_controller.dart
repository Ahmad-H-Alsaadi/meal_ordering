import '../api/api_service_controll.dart';
import '../model/meals_model.dart';

class MealsListController {
  Future<List<MealsModel>> getMeals(String name) async {
    try {
      final mealListData =
          await ApiServiceController.fetchMealsInCategory(name);

      final meals = mealListData
          .map((mealData) => MealsModel.fromJson(mealData))
          .toList();

      return meals;
    } catch (error) {
      // ignore: use_rethrow_when_possible
      throw error;
    }
  }
}

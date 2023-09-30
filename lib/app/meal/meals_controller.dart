import '../api/api_service_controll.dart';
import '../model/meal_details_model.dart';
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

class MealDetailsController {
  Future<List<MealDetailsModel>> getMealDetails(String id) async {
    try {
      final mealDetailsData = await ApiServiceController.fetchMealDetails(id);

      // ignore: unnecessary_type_check
      if (mealDetailsData is Map<String, dynamic>) {
        final mealDetailsList = [MealDetailsModel.fromJson(mealDetailsData)];
        return mealDetailsList;
      } else {
        throw Exception('Invalid meal details data format');
      }
    } catch (error) {
      rethrow;
    }
  }
}

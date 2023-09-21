import '../api/api_service_controll.dart';
import '../model/meal_details_model.dart';

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

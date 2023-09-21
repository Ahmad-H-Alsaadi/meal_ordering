class MealDetailsModel {
  final String mealDetailsId;
  final String mealDetailsName;
  final String categoryName;
  final String mealDetailsImage;
  final String mealDetailsDescription;
  final String mealDetailsVideo;

  MealDetailsModel({
    required this.mealDetailsId,
    required this.mealDetailsName,
    required this.categoryName,
    required this.mealDetailsImage,
    required this.mealDetailsDescription,
    required this.mealDetailsVideo,
  });

  factory MealDetailsModel.fromJson(Map<String, dynamic> json) =>
      MealDetailsModel(
        mealDetailsId: json['idMeal'],
        mealDetailsName: json['strMeal'],
        categoryName: json['strCategory'],
        mealDetailsImage: json['strMealThumb'],
        mealDetailsDescription: json['strInstructions'],
        mealDetailsVideo: json['strYoutube'],
      );
}

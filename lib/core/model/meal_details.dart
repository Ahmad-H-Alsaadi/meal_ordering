class MealDetails {
  final int mealDetailsId;
  final String mealDetailsName;
  final String categoryName;
  final String mealDetailsImage;
  final String mealDetailsDescription;
  final String mealDetailsVideo;
  const MealDetails({
    required this.mealDetailsId,
    required this.mealDetailsName,
    required this.categoryName,
    required this.mealDetailsImage,
    required this.mealDetailsDescription,
    required this.mealDetailsVideo,
  });

  factory MealDetails.fromJson(Map<String, dynamic> json) => MealDetails(
        mealDetailsId: json['idMeal'],
        mealDetailsName: json['strMeal'],
        categoryName: json['strCategory'],
        mealDetailsImage: json['strMealThumb'],
        mealDetailsDescription: json['strInstructions'],
        mealDetailsVideo: json['strYoutube'],
      );
}

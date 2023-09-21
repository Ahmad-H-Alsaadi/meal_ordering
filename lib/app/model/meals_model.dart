class MealsModel {
  final String mealId;
  final String mealName;
  final String mealImage;
  const MealsModel({
    required this.mealId,
    required this.mealName,
    required this.mealImage,
  });

  factory MealsModel.fromJson(Map<String, dynamic> json) => MealsModel(
        mealId: json['idMeal'],
        mealName: json['strMeal'],
        mealImage: json['strMealThumb'],
      );
}

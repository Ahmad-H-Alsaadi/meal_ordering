class MealsModel {
  final int mealId;
  final String mealName;
  final String mealImage;
  const MealsModel({
    required this.mealId,
    required this.mealName,
    required this.mealImage,
  });

  factory MealsModel.fromJson(Map<String, dynamic> json) => MealsModel(
        mealId: json['idCategory'],
        mealName: json['strCategory'],
        mealImage: json['strCategoryThumb'],
      );
}

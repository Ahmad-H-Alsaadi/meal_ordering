class Meals {
  final int mealId;
  final String mealName;
  final String mealImage;
  const Meals({
    required this.mealId,
    required this.mealName,
    required this.mealImage,
  });

  factory Meals.fromJson(Map<String, dynamic> json) => Meals(
        mealId: json['idCategory'],
        mealName: json['strCategory'],
        mealImage: json['strCategoryThumb'],
      );
}

class CategoryModel {
  final int categoryId;
  final String categoryName;
  final String categoryImage;
  final String categoryDescription;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryDescription,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categoryId: int.parse(json['idCategory']),
        categoryName: json['strCategory'],
        categoryImage: json['strCategoryThumb'],
        categoryDescription: json['strCategoryDescription'],
      );
}

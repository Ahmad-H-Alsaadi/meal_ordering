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

  factory CategoryModel.fromJson(dynamic json) => CategoryModel(
        categoryId: json['idCategory'],
        categoryName: json['strCategory'],
        categoryImage: json['strCategoryThumb'],
        categoryDescription: json['strCategoryDescription'],
      );

  static List<CategoryModel> categoryFromSnapshot(List snapshot) =>
      snapshot.map((data) => CategoryModel.fromJson(data)).toList();
}

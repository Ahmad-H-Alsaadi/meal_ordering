class Category {
  final int categoryId;
  final String categoryName;
  final String categoryImage;
  final String categoryDescription;

  Category({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json['idCategory'],
        categoryName: json['strCategory'],
        categoryImage: json['strCategoryThumb'],
        categoryDescription: json['strCategoryDescription'],
      );
}

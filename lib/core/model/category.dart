class Categoty {
  final int categoryId;
  final String categoryName;
  final String categoryImage;
  final String categoryDescription;
  const Categoty({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryDescription,
  });

  factory Categoty.fromJson(Map<String, dynamic> json) => Categoty(
        categoryId: json['idCategory'],
        categoryName: json['strCategory'],
        categoryImage: json['strCategoryThumb'],
        categoryDescription: json['strCategoryDescription'],
      );
}

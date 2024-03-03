class CategoryItem {
  final int id;
  final String categoryName;

  CategoryItem({required this.id, required this.categoryName});

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'],
      categoryName: json['categoryName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['categoryName'] = categoryName;
    return data;
  }
}

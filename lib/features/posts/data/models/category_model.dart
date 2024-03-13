class Category{
  final List<CategoryItem> category;

  Category({required this.category});

  factory Category.fromJson(json){
    List<CategoryItem> category = [];


      category = List<CategoryItem>.from(
        json.map((banner) => CategoryItem.fromJson(banner)),
      );
return Category(category: category);
  }


}

class CategoryItem {
  final int id;
  final String categoryName;

  CategoryItem({required this.id, required this.categoryName});

  factory CategoryItem.fromJson( json) {
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

import 'package:lakini_gp/features/posts/data/models/category_model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryItem> categories;
  CategoryLoaded(
    this.categories,
  );
}

class CategoryError extends CategoryState {
  final String errorMessage;

  CategoryError(this.errorMessage);
}

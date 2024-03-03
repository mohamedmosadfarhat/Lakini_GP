import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/features/posts/data/repos/add_post_repo.dart';
import 'category_states.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.addPostRepo) : super(CategoryInitial());

  final AddPostRepo? addPostRepo;

  Future<void> getAllCategories() async {
    emit(CategoryLoading());
    try {
      var results = await addPostRepo!.getCategoryName();
      results.fold((failure) {
        emit(CategoryError(failure.errorMessage));
      }, (items) {
        emit(CategoryLoaded(items));
      });
    } catch (e) {
      emit(CategoryError('Failed to load categories: $e'));
    }
  }
}

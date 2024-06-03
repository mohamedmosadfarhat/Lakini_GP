import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/features/ai/data/repo/ai_repo.dart';
import 'package:lakini_gp/features/home/data/models/item_model.dart';

part 'search_by_description_state.dart';

class SearchByDescriptionCubit extends Cubit<SearchByDescriptionState> {
  SearchByDescriptionCubit(this.aiRepo) : super(SearchByDescriptionInitial());
  final AiRepo aiRepo;
  
  Future<void> fetchResultByDescription(String des) async {
    try {
      emit(ResultByDescritionLoading());
     

      //var result = await aiRepo.fetchResultByDescription(des);
      var result = await aiRepo.compareText(des);

      
      result.fold((failure) {
        emit(ResultByDescritionFailur(failure.errMessage));
      }, (items) {
        emit(ResultByDescritionSuccess(items));
        print("ResultByDescritionSuccess");
      });
    } catch (e) {
      if (!isClosed) {
        emit(ResultByDescritionFailur(e.toString()));
      }
      print(e.toString());
    }
  }
}

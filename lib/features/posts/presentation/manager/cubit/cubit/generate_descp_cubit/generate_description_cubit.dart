import 'package:bloc/bloc.dart';
import 'package:lakini_gp/features/posts/data/models/generate_desc.dart';
import 'package:lakini_gp/features/posts/data/repos/add_post_repo.dart';
import 'package:meta/meta.dart';

part 'generate_description_state.dart';

class GenerateDescriptionCubit extends Cubit<GenerateDescriptionState> {
  GenerateDescriptionCubit(this.generateImageRepo)
      : super(GenerateDescriptionInitial());
  final GenerateImageRepo generateImageRepo;
  Future<void> fetchDescription({required String text}) async {
    emit(GenerateDescriptionLoading());
    var result = await generateImageRepo.fetchDescription(text: text);
    result.fold((failure) {
      emit(GenerateDescriptionFailure(failure.errMessage));
    }, (descrptionData) {
      emit(GenerateDescriptionSuccess(data: descrptionData));
    });
  }
}

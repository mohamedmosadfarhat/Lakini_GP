import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lakini_gp/features/posts/data/models/generate_desc.dart';
import 'package:lakini_gp/features/posts/data/models/image.dart';
import 'package:lakini_gp/features/posts/data/repos/add_post_repo.dart';
import 'package:meta/meta.dart';

part 'generate_image_state.dart';

class GenerateImageCubit extends Cubit<GenerateImageState> {
  GenerateImageCubit(this.generateImageRepo) : super(GenerateImageInitial());

  final GenerateImageRepo generateImageRepo;

  Future<void> fetchImage({required String text}) async {
    emit(GenerateImageLoading());
    var result = await generateImageRepo.fetchImages(text: text);
    result.fold((failure) {
      emit(GenerateImageFailure(failure.errMessage));
    }, (images) {
      emit(GenerateImageSuccess(images: images));
    });
  }

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

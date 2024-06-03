import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lakini_gp/features/ai/data/repo/ai_repo.dart';
import 'package:lakini_gp/features/home/data/models/item_model.dart';

part 'search_by_image_state.dart';

class SearchByImageCubit extends Cubit<SearchByImageState> {
  SearchByImageCubit(this.aiRepo) : super(SearchByAiInitial());
  final AiRepo aiRepo;
  final ImagePicker picker = ImagePicker();
  File? pickedImage;
  ImageProvider<Object>? imageProvider;
  int modelType = 0;
  fetchImage(ImageSource source) async {
    emit(PickImageLoading());

    final XFile? image = await picker.pickImage(source: source);
    if (image == null) {
      return;
    }
    pickedImage = File(image.path);
    imageProvider = FileImage(pickedImage!);
    emit(PickImageSuccess());
  }

  Future<void> UploadImage() async {
    try {
      emit(UploadImageLoading());
      
      var response;
      await aiRepo.UploadImage(pickedImage).then((value) {
        response = value;
      });
      if (response == 200) {
        emit(UploadImageSuccess());
        print("sucsess");
      } else if (response >= 500) {
        emit(UploadImageFailure(""));
        print("server error");
      }
    } catch (e) {
     
      if (!isClosed) {
        emit(UploadImageFailure(""));
      }
      print(e.toString());
    }
  }

  void ModelType(int modelType) {
    this.modelType = modelType;
    emit(SearchByAiInitial());
  }

  Future<void> fetchResult(String imgName) async {
    try {
      emit(ResultLoading());
      var result = await aiRepo.fetchResultByImage(imgName);
      result.fold((failure) {
        emit(ResultFailur(failure.errMessage));
      }, (items) {
        emit(ResultSuccess(items));
      });
    } catch (e) {
      if (!isClosed) {
        emit(ResultFailur(e.toString()));
      }
      
    }
  }
}

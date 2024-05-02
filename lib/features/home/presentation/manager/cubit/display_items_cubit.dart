import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/features/home/data/models/item_model.dart';
import 'package:lakini_gp/features/home/data/repos/home_repo.dart';

import '../../../../posts/data/models/category_model.dart';
import '../../../../posts/presentation/manager/cubit/post_cubit/app_state.dart';
import '../../../../profile/profile_model.dart';
import '../../../../register/helper/dio_helper.dart';
import '../../../../register/helper/end_point.dart';

part 'display_items_state.dart';

class DisplayItemsCubit extends Cubit<DisplayItemsState> {
  DisplayItemsCubit(this.homeRepo) : super(DisplayItemsInitial());
  final HomeRepo homeRepo;
  List<ItemModel> itemsSearch = [];
  String status = "lost";
  int currentIndex = 0;
  Future<void> fetchItems() async {
    emit(DisplayItemsLoading());
    var result = await homeRepo.fetchAllItems();
    result.fold((failure) {
      emit(DisplayItemsFailur(failure.errMessage));
    }, (items) {
      itemsSearch = items;
      emit(DisplayItemsSuccess(items));
    });
  }

  void getStatus(int indx) async {
    if (currentIndex == indx) return;
    currentIndex = indx;
    if (indx == 0) {
      this.status = "lost";
    } else if (indx == 1) {
      this.status = "found";
    } else if (indx == 2) {
      this.status = "missing";
    }
    emit(DisplayItemsLoading());
    var result = await homeRepo.fetchAllItems();

    result.fold((failure) {
      emit(DisplayItemsFailur(failure.errMessage));
    }, (items) {
      emit(DisplayItemsSuccess(items));
    });
  }

  /* late Category category;

  void getCategory() {
    emit(GetCategoryLoadingState());
    DioHelper.getData(url: GetCategory,token: token).then((value) {
      category = Category.fromJson(value.data);
      print(value);
      emit(GetCategorySuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCategoryErrorState());
    });
  }

  late ProfileModet profile;

  void getProfile() {
    print(userId);
    emit(GetProfileLoadingState());
    DioHelper.getData(url: "$GetProfile/$userId",token: token).then((value) {
      profile = ProfileModet.fromJson(value.data);
      print(value);
      emit(GetProfileSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetProfileErrorState());
    });
  } */
}

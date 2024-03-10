import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:lakini_gp/features/home/data/models/item_model.dart';
import 'package:lakini_gp/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

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
}

part of 'display_items_cubit.dart';

@immutable
sealed class DisplayItemsState {}

final class DisplayItemsInitial extends DisplayItemsState {}

final class DisplayItemsLoading extends DisplayItemsState {}

final class DisplayItemsFailur extends DisplayItemsState {
  final String errorMeassage;

  DisplayItemsFailur(this.errorMeassage);
}

final class DisplayItemsSuccess extends DisplayItemsState {
  List<ItemModel> items ;
  DisplayItemsSuccess(this.items);
}

/* class GetCategoryLoadingState extends DisplayItemsState {}

class GetCategorySuccessState extends DisplayItemsState {}

class GetCategoryErrorState extends DisplayItemsState {}

class GetProfileLoadingState extends AppState {}

class GetProfileSuccessState extends AppState {}

class GetProfileErrorState extends AppState {} */

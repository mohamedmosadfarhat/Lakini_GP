part of 'search_by_description_cubit.dart';


sealed class SearchByDescriptionState {}

final class SearchByDescriptionInitial extends SearchByDescriptionState {}
final class ResultByDescritionLoading extends SearchByDescriptionState {}
final class ResultByDescritionFailur extends SearchByDescriptionState {
  

 final String errorMeassage;

  ResultByDescritionFailur(this.errorMeassage);
}

final class ResultByDescritionSuccess extends SearchByDescriptionState {
  List<ItemModel> items ;
  ResultByDescritionSuccess(this.items);
}

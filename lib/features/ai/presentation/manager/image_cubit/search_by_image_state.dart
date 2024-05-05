part of 'search_by_image_cubit.dart';

@immutable
sealed class SearchByImageState {}

final class SearchByAiInitial extends SearchByImageState {}
final class PickImageLoading extends SearchByImageState {}
final class PickImageSuccess extends SearchByImageState {}
final class UploadImageLoading extends SearchByImageState {}
final class UploadImageSuccess extends SearchByImageState {}
final class UploadImageFailure extends SearchByImageState {
final String errorMeassage;

  UploadImageFailure(this.errorMeassage);
}
final class ResultLoading extends SearchByImageState {}
final class ResultFailur extends SearchByImageState {
  

 final String errorMeassage;

  ResultFailur(this.errorMeassage);
}

final class ResultSuccess extends SearchByImageState {
  List<ItemModel> items ;
  ResultSuccess(this.items);
}

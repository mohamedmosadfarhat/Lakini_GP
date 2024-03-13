import '../../../../../register/app_model.dart';

class AppState {}

class AddItemInitializing extends AppState {}

class AddItemLoading extends AppState {}

class AddItemSuccess extends AppState {
  AddItemSuccess();
}

class AddItemFailure extends AppState {
  AddItemFailure();
}

class AddImageLoading extends AppState {}

class AddImageSuccess extends AppState {}

class AddProfileImageLoading extends AppState {}

class AddProfileImageSuccess extends AppState {}

class GetCategoryLoadingState extends AppState {}

class GetCategorySuccessState extends AppState {}

class GetCategoryErrorState extends AppState {}

class GetProfileLoadingState extends AppState {}

class GetProfileSuccessState extends AppState {}

class GetProfileErrorState extends AppState {}

class UpdateProfileLoadingState extends AppState {}

class UpdateProfileSuccessState extends AppState {}

class UpdateProfileErrorState extends AppState {}

class DeleteProfileLoadingState extends AppState {}

class DeleteProfileSuccessState extends AppState {
  final AppModel delete;

  DeleteProfileSuccessState({required this.delete});
  
}

class DeleteProfileErrorState extends AppState {}

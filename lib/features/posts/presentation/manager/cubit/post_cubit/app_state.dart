import 'package:lakini_gp/features/posts/data/models/generate_desc.dart';

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

class AddChatImageLoading extends AppState {}

class AddChatImageSuccess extends AppState {}

class AddProfileImageLoading extends AppState {}

class AddProfileImageSuccess extends AppState {}

class GetCategoryLoadingState extends AppState {}

class GetCategorySuccessState extends AppState {}

class GetCategoryErrorState extends AppState {}

class GetAllUsersLoadingState extends AppState {}

class GetAllUsersSuccessState extends AppState {}

class GetAllUsersErrorState extends AppState {}

class GetProfileLoadingState extends AppState {}

class GetProfileSuccessState extends AppState {}

class GetProfileErrorState extends AppState {}

class GetLastChatSuccessState extends AppState {}

class GetLastChatErrorState extends AppState {}

class UpdateProfileLoadingState extends AppState {}

class UpdateProfileSuccessState extends AppState {}

class UpdateProfileErrorState extends AppState {}

class DeleteProfileLoadingState extends AppState {}

class DeleteProfileSuccessState extends AppState {
  final AppModel delete;

  DeleteProfileSuccessState({required this.delete});
}

class DeleteProfileErrorState extends AppState {}

class DeleteChatLoadingState extends AppState {}

class DeleteChatSuccessState extends AppState {
  final AppModel delete;

  DeleteChatSuccessState({required this.delete});
}

class DeleteChatErrorState extends AppState {}

class SendMessageLoadingState extends AppState {}

class SendMessageSuccessState extends AppState {}

class SendMessageErrorState extends AppState {}

// //generate description
// final class GenerateDescriptionInitial extends AppState {}

// final class GenerateDescriptionLoading extends AppState {}

// final class GenerateDescriptionSuccess extends AppState {
//   final List<GenerateDesc> data;
//   GenerateDescriptionSuccess({required this.data});
// }

// final class GenerateDescriptionFailure extends AppState {
//   final String errorMessage;

//   GenerateDescriptionFailure(this.errorMessage);
// }

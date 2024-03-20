



abstract class AppRegisterState {}

class AppRegisterInitialState extends AppRegisterState {}

class AppRegisterLoadingState extends AppRegisterState {}

class AppRegisterSuccessState extends AppRegisterState {
  final String? message;
  final bool? status;
  AppRegisterSuccessState({required this.message,required this.status});
}

class AppRegisterErrorState extends AppRegisterState {
  
 AppRegisterErrorState();
}

class AddImageLoading extends AppRegisterState {}

class AddImageSuccess extends AppRegisterState {}

import 'package:lakini_gp/features/register/app_model.dart';



abstract class AppRegisterState {}

class AppRegisterInitialState extends AppRegisterState {}

class AppRegisterLoadingState extends AppRegisterState {}

class AppRegisterSuccessState extends AppRegisterState {
  final AppModel registerModel;
  AppRegisterSuccessState(this.registerModel);
}

class AppRegisterErrorState extends AppRegisterState {
  final String error;
 AppRegisterErrorState(this.error);
}

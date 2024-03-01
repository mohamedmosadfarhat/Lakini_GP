


import 'package:lakini_gp/features/register/login_model.dart';


import '../../app_model.dart';

abstract class AppLoginState {}

class AppLoginInitialState extends AppLoginState {}

class AppLoginLoadingState extends AppLoginState {}

class AppLoginSuccessState extends AppLoginState {
  final UserData loginModel;
  AppLoginSuccessState(this.loginModel);
}

class AppLoginErrorState extends AppLoginState {
  final String error;
 AppLoginErrorState(this.error);
}

class AppConfirmLoadingState extends AppLoginState {}

class AppConfirmSuccessState extends AppLoginState {
  final AppModel confirmModel;
  AppConfirmSuccessState(this.confirmModel);
}

class AppConfirmErrorState extends AppLoginState {
  final String error;
 AppConfirmErrorState(this.error);
}

class AppReconfirmLoadingState extends AppLoginState {}

class AppReconfirmSuccessState extends AppLoginState {
  final AppModel reConfirmModel;
  AppReconfirmSuccessState(this.reConfirmModel);
}

class AppReconfirmErrorState extends AppLoginState {
  final String error;
 AppReconfirmErrorState(this.error);
}

class AppForgotPasswordLoadingState extends AppLoginState {}

class AppForgotPasswordSuccessState extends AppLoginState {
  final AppModel forgotPasswordModel;
  AppForgotPasswordSuccessState(this.forgotPasswordModel);
}

class AppForgotPasswordErrorState extends AppLoginState {
  final String error;
 AppForgotPasswordErrorState(this.error);
}
class AppSetPasswordLoadingState extends AppLoginState {}

class AppSetPasswordSuccessState extends AppLoginState {
  final AppModel setPasswordModel;
  AppSetPasswordSuccessState(this.setPasswordModel);
}

class AppSetPasswordErrorState extends AppLoginState {
  final String error;
 AppSetPasswordErrorState(this.error);
}



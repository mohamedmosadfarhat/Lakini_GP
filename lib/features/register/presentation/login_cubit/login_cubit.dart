import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakini_gp/features/register/helper/end_point.dart';
import 'package:lakini_gp/features/register/login_model.dart';

import '../../app_model.dart';
import '../../helper/dio_helper.dart';
import 'login_state.dart';

class AppLoginCubit extends Cubit<AppLoginState> {
  AppLoginCubit() : super(AppLoginInitialState());

  static AppLoginCubit get(context) => BlocProvider.of(context);
  late UserData loginModel;
  bool login = false;
  void userLogin({required String email, required String password}) {
    emit(AppLoginLoadingState());
    DioHelper.postData(
        accept: "text/plain",
        content: "application/json",
        url: Login,
        data: {
          "password": password,
          "email": email,
        }).then((value) {
      loginModel = UserData.fromJson(value.data);
      print("sdffsfasd");
      login = true;
      print(value);
      emit(AppLoginSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(AppLoginErrorState(error.toString()));
    });
  }

  late AppModel confirmModel;

  void userConfirm({
    required String userName,
    required String code,
  }) {
    emit(AppConfirmLoadingState());
    DioHelper.putData(content: "application/json", url: Confirm, data: {
      "userName": userName,
      "code": code,
    }).then((value) {
      confirmModel = AppModel.fromJson(value.data);

      print(confirmModel.message);

      print(value);
      emit(AppConfirmSuccessState(confirmModel));
    }).catchError((error) {
      print("Errorrrrrr: ${error.toString()}");
      emit(AppConfirmErrorState(error.toString()));
    });
  }

  late AppModel reConfirmModel;

  void userReconfirm({
    required String email,
  }) {
    emit(AppReconfirmLoadingState());
    DioHelper.postData(
        content: "application/json",
        url: "$Reconfirm/$email",
        data: {
          "email ": email,
        }).then((value) {
      reConfirmModel = AppModel.fromJson(value.data);

      print(reConfirmModel.message);

      print(value);
      emit(AppReconfirmSuccessState(reConfirmModel));
    }).catchError((error) {
      print("Errorrrrrr: ${error.toString()}");
      emit(AppReconfirmErrorState(error.toString()));
    });
  }

  late AppModel forgotPasswordModel;

  void userforgotPassword({
    required String email,
  }) {
    emit(AppForgotPasswordLoadingState());
    DioHelper.postData(
        content: "application/json",
        url: "$ForgotPassword/$email",
        data: {
          "email ": email,
        }).then((value) {
      forgotPasswordModel = AppModel.fromJson(value.data);

      print(forgotPasswordModel.message);

      print(value);
      emit(AppForgotPasswordSuccessState(forgotPasswordModel));
    }).catchError((error) {
      print("Errorrrrrr: ${error.toString()}");
      emit(AppForgotPasswordErrorState(error.toString()));
    });
  }

  late AppModel setPasswordModel;

  void usersetPassword({
    required String myToken,
    required String email,
    required String password,
  }) {
    emit(AppSetPasswordLoadingState());
    DioHelper.putData(content: "application/json", url: SetPassword, data: {
      "token": myToken,
      "email": email,
      "newPassword": password,
    }).then((value) {
      setPasswordModel = AppModel.fromJson(value.data);

      print(setPasswordModel.message);

      print(value);
      emit(AppSetPasswordSuccessState(setPasswordModel));
    }).catchError((error) {
      print("Errorrrrrr: ${error.toString()}");

      emit(AppSetPasswordErrorState(error.toString()));
    });
  }
}

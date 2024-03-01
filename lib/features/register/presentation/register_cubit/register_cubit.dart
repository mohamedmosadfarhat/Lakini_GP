import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lakini_gp/features/register/app_model.dart';

import '../../helper/dio_helper.dart';
import '../../helper/end_point.dart';
import 'register_state.dart';

class AppRegisterCubit extends Cubit<AppRegisterState> {
  AppRegisterCubit() : super(AppRegisterInitialState());

  static AppRegisterCubit get(context) => BlocProvider.of(context);
  late AppModel registerModel;

  void userRegister({
    required String userName,
    required String email,
    required String password,
    required String phone,
    required String city,
    required String region,
  }) {
    emit(AppRegisterLoadingState());
    DioHelper.postData(content: "application/json", url: Register, data: {
      "userName": userName,
      "email": email,
      "password": password,
      "phoneNumber": phone,
      "city": city,
      "region": region,
    }).then((value) {
      registerModel = AppModel.fromJson(value.data);

      print(registerModel.message);

      print(value);
      emit(AppRegisterSuccessState(registerModel));
    }).catchError((error) {
      print("Errorrrrrr: ${error.toString()}");
      emit(AppRegisterErrorState(error.toString()));
    });
  }
  
}

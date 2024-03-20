import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


import 'package:http/http.dart' as http;

import '../../helper/end_point.dart';
import 'register_state.dart';

class AppRegisterCubit extends Cubit<AppRegisterState> {
  AppRegisterCubit() : super(AppRegisterInitialState());

  static AppRegisterCubit get(context) => BlocProvider.of(context);

  Future<void> userRegister({
    required String userName,
    required String email,
    required String password,
    required String phone,
    required String city,
    required String region,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse("$url/$Register"));

    request.fields['UserName'] = userName;
    request.fields['Email'] = email;
    request.fields['Password'] = password;
    request.fields['City'] = city;
    request.fields['Region'] = region;
    request.fields['PhoneNumber'] = phone;

    if (pickedImage != null) {
      request.files.add(
          await http.MultipartFile.fromPath('AccountPhoto', pickedImage!.path));
    }
    emit(AppRegisterLoadingState());
    var response = await request.send();

    if (response.statusCode == 200) {
      print('Register Done successfully');
     
      var responseBody = await response.stream.bytesToString();
    // Parse the JSON string into a Map
    var responseJson = json.decode(responseBody);
    // Access the "message" field from the Map
    var message = responseJson["message"];
    var status = responseJson["status"];
    print('Register Done successfully');
    print('Response Body: $message');
      emit(AppRegisterSuccessState(message: message,status: status));
    } else {
      print(response.stream.bytesToString());
      print('Failed to Register');
      emit(AppRegisterErrorState());
    }
  }

  final ImagePicker picker = ImagePicker();
  File? pickedImage;
  ImageProvider<Object>? imageProvider;

  fetchImage() async {
    emit(AddImageLoading());
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    pickedImage = File(image.path);
    imageProvider = FileImage(pickedImage!);
    emit(AddImageSuccess());
  }
}

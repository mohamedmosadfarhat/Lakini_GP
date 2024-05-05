import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lakini_gp/features/profile/profile_model.dart';

import 'package:lakini_gp/features/register/helper/end_point.dart';
import 'package:http/http.dart' as http;

import '../../../../../register/app_model.dart';
import '../../../../../register/helper/dio_helper.dart';
import '../../../../data/models/category_model.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AddItemInitializing());

  static AppCubit get(context) => BlocProvider.of(context);

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

  final ImagePicker profilePicker = ImagePicker();
  File? profileImage;
  ImageProvider<Object>? profileImageProvider;

  fetchProfileImage() async {
    emit(AddProfileImageLoading());
    final XFile? image =
        await profilePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    profileImage = File(image.path);
    profileImageProvider = FileImage(profileImage!);
    emit(AddProfileImageSuccess());
  }

  Future<void> submit({
    required String lostType,
    required String title,
    required String caption,
    required String phoneNumber,
    required String location,
    required String status,
    required String reward,
    String? foundData,
    double? lat,
    double? lng,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse("$url/$AddItem"));

    request.headers['Authorization'] = 'Bearer $token';
    request.fields['Name'] = title;
    request.fields['Description'] = caption;
    request.fields['Status'] = status;
    request.fields['PhoneNumber'] = phoneNumber;
    request.fields['FoundPlace'] = location;
    request.fields['CategoryName'] = lostType;
    request.fields['Award'] = reward;
    request.fields['FoundDate'] = foundData ?? "";
    request.fields['Latitude'] = lat.toString();
    request.fields['Longitude'] = lng.toString();

    if (pickedImage != null) {
      request.files.add(
          await http.MultipartFile.fromPath('ImagePhoto', pickedImage!.path));
    }
    emit(AddItemLoading());
    var response = await request.send();

    if (response.statusCode == 200) {
      print('Item added successfully');
      String responseBody = await response.stream.bytesToString();
      print('Response Body: $responseBody');
      emit(AddItemSuccess());
    } else {
      print(response.stream.bytesToString());
      print('Failed to add item');
      emit(AddItemFailure());
    }
  }

  late Category category;

  void getCategory() {
    emit(GetCategoryLoadingState());
    DioHelper.getData(url: GetCategory).then((value) {
      category = Category.fromJson(value.data);
      print(value);
      emit(GetCategorySuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCategoryErrorState());
    });
  }

  late ProfileModet profile;

  void getProfile() {
    print(userId);
    emit(GetProfileLoadingState());
    DioHelper.getData(url: "$GetProfile/$userId").then((value) {
      profile = ProfileModet.fromJson(value.data);
      print(value);
      emit(GetProfileSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetProfileErrorState());
    });
  }

  Future<void> update({
    required String UserName,
    required String Email,
    required String Phone,
    required String City,
    required String Region,
  }) async {
    var request =
        http.MultipartRequest('PUT', Uri.parse("$url/$UpdateAccount"));
    print(profile.userName);
    print(profile.email);
    print(profile.phone);
    print(profile.city);
    print(profile.region);
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['UserName'] = UserName;
    request.fields['Email'] = Email;
    request.fields['Phone'] = Phone;
    request.fields['City'] = City;
    request.fields['Region'] = Region;

    if (profileImage != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'AccountPhoto', profileImage!.path));
    }
    emit(UpdateProfileLoadingState());
    var response = await request.send();

    if (response.statusCode == 200) {
      print("Updated successfully");
      String responseBody = await response.stream.bytesToString();
      print('Response Body: $responseBody');
      emit(UpdateProfileSuccessState());
      getProfile();
    } else {
      print(response.stream.bytesToString());
      print('Failed to Update');
      emit(UpdateProfileErrorState());
    }
  }

  late AppModel delete;

  void deleteProfile() {
    print(userId);
    emit(DeleteProfileLoadingState());
    DioHelper.deleteData(url: "$DeleteAccount/$userId", token: token)
        .then((value) {
      delete = AppModel.fromJson(value.data);
      print(value);
      emit(DeleteProfileSuccessState(delete: delete));
    }).catchError((error) {
      print(error.toString());
      emit(DeleteProfileErrorState());
    });
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lakini_gp/features/posts/data/models/last_chat_model.dart';
import 'package:lakini_gp/features/posts/data/models/users_model.dart';
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

  Category? category;

  void getCategory() {
    emit(GetCategoryLoadingState());
    DioHelper.getData(url: GetCategory, token: token).then((value) {
      category = Category.fromJson(value.data);
      print(value);
      emit(GetCategorySuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCategoryErrorState());
    });
  }


  AllUsers? users;
  List<String?> lastM = [];
  List<String?> lastT = [];

  void getAllUsers() {
    emit(GetAllUsersLoadingState());
    DioHelper.getData(url: GetAllUsers, token: token).then((value) {
      users = AllUsers.fromJson(value.data);
      print(value);
      for (var user in users!.user) {
        print(user.userName);
       
        getLastChat(user.userId);
         print(user.userId);
      }

      print(lastM);

      emit(GetAllUsersSuccessState());
    }).catchError((error) {
      emit(GetAllUsersErrorState());
      print(error.toString());
    });
  }


  ProfileModet? profile;

  void getProfile() {
    print(userId);
    emit(GetProfileLoadingState());
    DioHelper.getData(url: "$GetProfile/$userId", token: token).then((value) {
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
    print(profile!.userName);
    print(profile!.email);
    print(profile!.phone);
    print(profile!.city);
    print(profile!.region);
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

  final ImagePicker chatImagepicker = ImagePicker();
  File? pickedchatImage;

  fetchchatImage() async {
    emit(AddChatImageLoading());
    final XFile? image =
        await chatImagepicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    pickedchatImage = File(image.path);
    emit(AddChatImageSuccess());
  }

  Future<void> sendMessage({
    required String receiverEmail,
    String? message,
    double? Latitude,
    double? Longitude,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse("$url/$AddChat"));
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['receiverEmail'] = receiverEmail;
    request.fields['message'] = message ?? "";
    request.fields['Latitude'] = Latitude.toString();
    request.fields['Longitude'] = Longitude.toString();

    if (pickedchatImage != null) {
      request.files.add(
          await http.MultipartFile.fromPath('File', pickedchatImage!.path));
    }

    emit(SendMessageLoadingState());

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Message sent successfully');
      String responseBody = await response.stream.bytesToString();
      print('Response Body: $responseBody');
      pickedchatImage = null;
      emit(SendMessageSuccessState());
    } else {
      print(response.stream.bytesToString());
      print('Failed to send message');
      emit(SendMessageErrorState());
    }
  }

  late AppModel deleteChat;

  void deleteChatMethod(userId) {
    emit(DeleteChatLoadingState());
    DioHelper.deleteData(url: "$DeleteChat?ReceiverId=$userId", token: token)
        .then((value) {
      deleteChat = AppModel.fromJson(value.data);
      print(value);
      emit(DeleteChatSuccessState(delete: deleteChat));
    }).catchError((error) {
      print(error.toString());
      emit(DeleteChatErrorState());
    });
  }

  LastChat? lastChat;

  void getLastChat(userId) {
    DioHelper.getData(url: "$GetLastChat?recieverId=$userId", token: token)
        .then((value) {
      lastChat = LastChat.fromJson(value.data);
      print(lastChat?.content);
      lastM.add(lastChat?.content);
      lastT.add(lastChat?.time);
      print(lastM);

     
    }).catchError((error) {
      emit(GetLastChatErrorState());
      print(error.toString());
    });
  }
}

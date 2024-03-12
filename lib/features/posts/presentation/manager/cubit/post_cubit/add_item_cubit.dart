import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:lakini_gp/features/register/helper/end_point.dart';
import 'package:http/http.dart' as http;

import 'add_item_state.dart';

class AddItemCubit extends Cubit<AddItemState> {
  AddItemCubit() : super(AddItemInitializing());

  static AddItemCubit get(context) => BlocProvider.of(context);

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

  Future<void> submit({
    required String lostType,
    required String titlel,
    required String caption,
    required String phoneNumber,
    required String location,
    required String status,
    required String reward,
    String? foundData,
  }) async {
    var url = 'https://wdw888lb-7075.uks1.devtunnels.ms/api/Item/Add-Item';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['Name'] = titlel;
    request.fields['Description'] = caption;
    request.fields['Status'] = status;
    request.fields['PhoneNumber'] = phoneNumber;
    request.fields['FoundPlace'] = location;
    request.fields['CategoryName'] = lostType;
    request.fields['Award'] = reward;
    request.fields['FoundDate'] = foundData ?? "";

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
      print('Failed to add item');
      emit(AddItemFailure());
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lakini_gp/features/posts/data/models/item_model.dart';
import 'package:lakini_gp/features/posts/helper/api_services.dart';
import 'package:lakini_gp/features/register/helper/end_point.dart';

import '../../../../../register/helper/dio_helper.dart';
import '../../../../data/repos/add_post_repo.dart';
import 'add_item_state.dart';

class AddItemCubit extends Cubit<AddItemState> {
  AddItemCubit() : super(AddItemInitializing());

  static AddItemCubit get(context) => BlocProvider.of(context);

  late Item? item;

  void addItem({
    required String name,
    required String status,
    required String desc,
    required dynamic image,
    required String place,
    required String phone,
    required String categoryName,
    String? reward,
  }) {
    emit(AddItemLoading());
    DioHelper.postData(
        accept: "text/plain",
        content: "application/x-www-form-urlencoded",
        myToken: token,
        url: AddItem,
        data: {
          "Name": name,
          "Description": desc,
          "Status": status,
          "PhoneNumber": phone,
          "ImagePhoto": image,
          "FoundPlace": place,
          "CategoryName": categoryName,
        }).then((value) {
      item = Item.fromJson(value.data);
      print(value);
      emit(AddItemSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(AddItemFailure(message: 'Failed to add Item: $error'));
    });
  }

  // final Item? item;
  // final AddPostRepo? addPostRepo;
  // Future<void> addItem({
  //   required String name,
  //   required String status,
  //   required String desc,
  //   required String image,
  //   required String place,
  //   required String phone,
  //   required String categoryName,
  //   String? reward,
  // }) async {
  //   emit(AddItemLoading());
  //   try {
  //     var items = await apiService!.post(
  //         endPoint: 'Item/Add-Item',
  //         data: {
  //           'name': name,
  //           'status': status,
  //           'description': desc,
  //           'imagePhoto': image,
  //           'foundPlace': place,
  //           'phoneNumber': phone,
  //           'award': reward,
  //           'categoryName': categoryName,
  //         },
  //         token: token);
  //     emit(AddItemSuccess());
  //   } catch (e) {
  //     emit(AddItemFailure(message: 'Failed to add Item: $e'));
  //   }
  // }
}

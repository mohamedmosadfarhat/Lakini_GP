import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lakini_gp/core/erros/failure.dart';
import 'package:lakini_gp/core/utils/api_sevices.dart';
import 'package:lakini_gp/features/ai/data/repo/ai_repo.dart';
import 'package:lakini_gp/features/home/data/models/item_model.dart';
import 'package:http/http.dart' as http;

class AiRepoImpl extends AiRepo {
  AiRepoImpl(this.apiService);
  ApiService apiService;
  final ImagePicker picker = ImagePicker();
  File? pickedImage;

  @override
  Future<Either<Failure, List<ItemModel>>> fetchResultByImage(
    String imageName,
  ) async {
    try {
      var data = await apiService.get(
          endPoint: 'Item/get-similar-image-ML?imgurl=$imageName&choice=${0}');
      List<ItemModel> items = [];
      for (var item in data) {
        try {
          items.add(ItemModel.fromJson(item));
        } catch (e) {
          items.add(ItemModel.fromJson(item));
          print(e.toString());
        }
      }
      return right(items);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      print("objectl2");
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<int> UploadImage(File? pickedImage) async {
    var upload = http.MultipartRequest(
      'POST',
      Uri.parse(
          "https://wdw888lb-7075.uks1.devtunnels.ms/api/Item/Upload-Images-Search"),
    );

    if (pickedImage != null) {
      upload.files
          .add(await http.MultipartFile.fromPath('Image', pickedImage.path));
    }
    var response = await upload.send();

    print(response.statusCode);
    return response.statusCode;
  }

  @override
  Future<Either<Failure, List<ItemModel>>> fetchResultByDescription(
      String des) async {
    try {
      var data = await apiService.get(endPoint: 'Item/Compare-Text-ML');
      //${DescriptionSearchModel(findObject: des)}

      List<ItemModel> items = [];
      for (var item in data) {
        try {
          items.add(ItemModel.fromJson(item));
        } catch (e) {
          items.add(ItemModel.fromJson(item));
          print(e.toString());
        }
      }
      return right(items);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      print("objectl2");
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  //==========================================================================
  @override
  // Future<Either<Failure, List<ItemModel>>> compareText(String des) async {
  //   // Initialize Dio
  //   Dio dio = Dio();

  //   // Define the endpoint URL
  //   String endpointUrl =
  //       'https://wdw888lb-7075.uks1.devtunnels.ms/api.com/Item/Compare-Text-ML';

  //   // Create a sample request
  //   CompareTextRequest request = CompareTextRequest(
  //     findObject: des,
  //     foundedObjects: ["Object 1", "Object 2"],
  //   );

  //   try {
  //     // Make a POST request to the endpoint
  //     Response data = await dio.post(
  //       endpointUrl,
  //       data: request.toJson(),
  //     );

  //     // Handle the response
  //     if (data.statusCode == 200) {
  //       List<ItemModel> items = [];
  //       for (var item in data.data) {
  //         try {
  //           items.add(ItemModel.fromJson(item));
  //         } catch (e) {
  //           items.add(ItemModel.fromJson(item));
  //           print(e.toString());
  //         }
  //       }
  //       return right(items);
  //     }
  //   } catch (e) {

  //     if (e is DioException) {
  //       return left(
  //         ServerFailure.fromDioError(e),
  //       );
  //     }
  //     print("objectl2");
  //     return left(
  //       ServerFailure(
  //         e.toString(),
  //       ),
  //     );
  //   }

  // }
//
  Future<Either<Failure, List<ItemModel>>> compareText(String des) async {
    // Initialize Dio with options
    Dio dio = Dio(BaseOptions(
      baseUrl: 'https://wdw888lb-7075.uks1.devtunnels.ms/api',
    ));

    // Define the endpoint URL
    String endpointUrl = '/Item/Compare-Text-ML';

    // Create a sample request
    CompareTextRequest request = CompareTextRequest(
      findObject: des,
      foundedObjects: ["Object 1", "Object 2"],
    );

    try {
      // Make a POST request to the endpoint
      Response response = await dio.post(
        endpointUrl,
        data: request.toJson(),
      );

      // Handle the response
      if (response.statusCode == 200) {
        List<ItemModel> items = [];
        List<dynamic> responseData = response.data;
        for (var item in responseData) {
          try {
            items.add(ItemModel.fromJson(item));
          } catch (e) {
            print('Error parsing item: $e');
          }
        }
        return Right(items);
      } else {
        print('Request failed with status: ${response.statusCode}');
        return Left(ServerFailure(
            'Request failed with status: ${response.statusCode}'));
      }
    } catch (e) {
      print('Error occurred: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

//============================
}

class CompareTextRequest {
  String findObject;
  List<String>? foundedObjects;

  CompareTextRequest({required this.findObject, this.foundedObjects});

  Map<String, dynamic> toJson() {
    return {
      'find_object': findObject,
      'founded_objects': foundedObjects,
    };
  }
}

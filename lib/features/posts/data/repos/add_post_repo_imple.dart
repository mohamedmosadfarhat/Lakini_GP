import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lakini_gp/core/erros/failure.dart';
import 'package:lakini_gp/features/posts/data/models/generate_desc.dart';
import 'package:lakini_gp/features/posts/data/models/image.dart';
import 'package:lakini_gp/features/posts/data/repos/add_post_repo.dart';
import 'package:lakini_gp/features/posts/helper/api_services.dart';

class ImageGenerateImple implements GenerateImageRepo {
  final APIServices apiServices;

  ImageGenerateImple(this.apiServices);

  @override
  Future<Either<Failure, List<String>>> fetchImages(
      {required String text}) async {
    try {
      var data =
          await apiServices.getImageLink(endPoint: '/create_img?text=$text');
      List<String> imageLinks = List<String>.from(data['images_links']);

      return right(imageLinks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GenerateDesc>>> fetchDescription(
      {required String text}) async {
    try {
      var data = await apiServices.getDescription(
          endPoint: '/descibe_img_fake?image_path_url=$text');
      List<GenerateDesc> dataList = [];
      dataList.add(GenerateDesc.fromJson(data as Map<String, dynamic>));

      return right(dataList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
// import 'package:dartz/dartz.dart';
// import 'package:lakini_gp/core/erros/failure.dart';
// import 'package:lakini_gp/features/home/data/models/item_model.dart';
// import 'package:lakini_gp/features/home/data/repos/home_repo.dart';
// import 'package:lakini_gp/features/posts/helper/api_services.dart';

// class HomeRepoImple implements HomeRepo {
//   final ApiServices apiServices;
//   HomeRepoImple(this.apiServices);
//   @override
//   Future<Map> fetchNewsetBooks() async {
//     try {
//       var data =
//           await apiServices.get(endPoint: '/volumes?q=subject:programming');
//       List<String> books = [];
//       for (var item in data['items']) {
//         books.add(BookModel.fromJson(item));
//       }
//       return right(books);
//     } on Exception catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioError(e));
//       }
//       return left(ServerFailure(e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, List<ItemModel>>> fetchAllItems() {
//     // TODO: implement fetchAllItems
//     throw UnimplementedError();
//   }
// }

// // import 'dart:math';
// //
// // import 'package:dartz/dartz.dart';
// // import 'package:dio/dio.dart';
// // import 'package:lakini_gp/core/utils/errors/failure.dart';
// // import 'package:lakini_gp/features/posts/data/models/category_model.dart';
// // import 'package:lakini_gp/features/posts/data/models/item_model.dart';
// // import 'package:lakini_gp/features/posts/data/repos/add_post_repo.dart';
// // import 'package:lakini_gp/features/posts/helper/api_services.dart';
// //
// // class AddPostRepoImplement implements AddPostRepo {
// //   final APIService apiService;
// //
// //   AddPostRepoImplement(this.apiService);
// //   List<CategoryItem> items = [];
// //   @override
// //   Future<Either<Failure, List<CategoryItem>>> getCategoryName() async {
// //     try {
// //       var data = await apiService.get(endPoint: 'Category/GetAll');
// //       var items = data.map((item) => CategoryItem.fromJson(item)).toList();
// //
// //       return right(items);
// //     } catch (e) {
// //       if (e is DioException) {
// //         return left(
// //           ServerFailure.fromDioExceptionError(e),
// //         );
// //       }
// //       return left(
// //         ServerFailure(
// //           e.toString(),
// //         ),
// //       );
// //     }
// //   }
// //
// //   @override
// //   Future<Either<Failure, void>> addItem(
// //     String name,
// //     String status,
// //     String description,
// //     String foundPlace,
// //     String phoneNumber,
// //     String image,
// //   ) async {
// //     try {
// //       final items = {
// //         'status': status,
// //         'imagePhoto': image,
// //         'name': name,
// //         'description': description,
// //         'foundPlace': foundPlace,
// //         'phoneNumber': phoneNumber,
// //       };
// //       var itemsList =
// //           await apiService.post(endPoint: 'Item/Add-Item', data: items);
// //
// //       List<Item> addedItems = [Item.fromJson(itemsList)];
// //       return Right(addedItems);
// //     } catch (e) {
// //       if (e is DioException) {
// //         return Left(ServerFailure.fromDioExceptionError(e));
// //       } else {
// //         return Left(ServerFailure(e.toString()));
// //       }
// //     }
// //   }
// // }

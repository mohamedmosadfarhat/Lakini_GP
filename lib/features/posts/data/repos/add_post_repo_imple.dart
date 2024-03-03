// import 'dart:math';
//
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:lakini_gp/core/utils/errors/failure.dart';
// import 'package:lakini_gp/features/posts/data/models/category_model.dart';
// import 'package:lakini_gp/features/posts/data/models/item_model.dart';
// import 'package:lakini_gp/features/posts/data/repos/add_post_repo.dart';
// import 'package:lakini_gp/features/posts/helper/api_services.dart';
//
// class AddPostRepoImplement implements AddPostRepo {
//   final APIService apiService;
//
//   AddPostRepoImplement(this.apiService);
//   List<CategoryItem> items = [];
//   @override
//   Future<Either<Failure, List<CategoryItem>>> getCategoryName() async {
//     try {
//       var data = await apiService.get(endPoint: 'Category/GetAll');
//       var items = data.map((item) => CategoryItem.fromJson(item)).toList();
//
//       return right(items);
//     } catch (e) {
//       if (e is DioException) {
//         return left(
//           ServerFailure.fromDioExceptionError(e),
//         );
//       }
//       return left(
//         ServerFailure(
//           e.toString(),
//         ),
//       );
//     }
//   }
//
//   @override
//   Future<Either<Failure, void>> addItem(
//     String name,
//     String status,
//     String description,
//     String foundPlace,
//     String phoneNumber,
//     String image,
//   ) async {
//     try {
//       final items = {
//         'status': status,
//         'imagePhoto': image,
//         'name': name,
//         'description': description,
//         'foundPlace': foundPlace,
//         'phoneNumber': phoneNumber,
//       };
//       var itemsList =
//           await apiService.post(endPoint: 'Item/Add-Item', data: items);
//
//       List<Item> addedItems = [Item.fromJson(itemsList)];
//       return Right(addedItems);
//     } catch (e) {
//       if (e is DioException) {
//         return Left(ServerFailure.fromDioExceptionError(e));
//       } else {
//         return Left(ServerFailure(e.toString()));
//       }
//     }
//   }
// }

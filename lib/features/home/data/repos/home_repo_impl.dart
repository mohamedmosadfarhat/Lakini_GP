import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lakini_gp/core/erros/failure.dart';
import 'package:lakini_gp/core/utils/api_sevices.dart';
import 'package:lakini_gp/features/home/data/models/item_model.dart';
import 'package:lakini_gp/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<ItemModel>>> fetchAllItems() async {
    try {
      var data = await apiService.get(endPoint: 'Item/get-Item-User-Details');
      List<ItemModel> items = [];
      for (var item in data) {
        try {
          items.add(ItemModel.fromJson(item));

          print("try");
        } catch (e) {
          items.add(ItemModel.fromJson(item));
          print(e.toString());
          print("catch");
        }
      }
      return right(items);
    } catch (e) {
      if (e is DioException) {
        print("objectl");
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
}

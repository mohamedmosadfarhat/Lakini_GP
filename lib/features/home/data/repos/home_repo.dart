import 'package:dartz/dartz.dart';
import 'package:lakini_gp/core/erros/failure.dart';
import 'package:lakini_gp/features/home/data/models/item_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ItemModel>>> fetchAllItems();
 
}
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lakini_gp/core/erros/failure.dart';
import 'package:lakini_gp/features/home/data/models/item_model.dart';

abstract class AiRepo {
  Future<Either<Failure, List<ItemModel>>> fetchResultByImage(String imageName);
  Future UploadImage(File? pickedImage);

  Future<Either<Failure, List<ItemModel>>> fetchResultByDescription(String des);
  Future<Either<Failure, List<ItemModel>>> compareText(String des);
}

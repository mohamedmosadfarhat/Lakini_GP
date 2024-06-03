import 'package:dartz/dartz.dart';
import 'package:lakini_gp/core/erros/failure.dart';
import 'package:lakini_gp/features/posts/data/models/generate_desc.dart';
import 'package:lakini_gp/features/posts/data/models/image.dart';

abstract class GenerateImageRepo {
  Future<Either<Failure, List<String>>> fetchImages({required String text});
  Future<Either<Failure, List<GenerateDesc>>> fetchDescription(
      {required String text});
}

/*
import 'package:dartz/dartz.dart';
import 'package:lakini_gp/features/posts/data/models/category_model.dart';


import '../../../../core/utils/errors/failure.dart';

abstract class AddPostRepo {
  Future<Either<Failure, void>> addItem(
    String name,
    String status,
    String description,
    String foundPlace,
    String phoneNumber,
    String image,
  );
  Future<Either<Failure, List<CategoryItem>>> getCategoryName();
}
*/

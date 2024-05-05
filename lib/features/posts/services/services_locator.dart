import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lakini_gp/features/posts/data/repos/add_post_repo_imple.dart';
import 'package:lakini_gp/features/posts/helper/api_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<APIServices>(
    APIServices(
      Dio(),
    ),
  );
  getIt.registerSingleton<ImageGenerate>(
    ImageGenerate(
      getIt.get<APIServices>(),
    ),
  );
}

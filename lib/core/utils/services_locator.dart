import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lakini_gp/core/utils/api_sevices.dart';
import 'package:lakini_gp/features/home/data/repos/home_repo_impl.dart';
import 'package:lakini_gp/features/posts/data/repos/add_post_repo.dart';
import 'package:lakini_gp/features/posts/data/repos/add_post_repo_imple.dart';
import 'package:lakini_gp/features/posts/helper/api_services.dart';

final getit = GetIt.instance;
void setup() {
  getit.registerSingleton<HomeRepoImpl>(HomeRepoImpl(ApiService(Dio())));

  getit.registerSingleton<APIServices>(
    APIServices(
      Dio(),
    ),
  );
  getit.registerSingleton<GenerateImageRepo>(
      ImageGenerateImple(getit.get<APIServices>()));
}

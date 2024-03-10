import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lakini_gp/core/utils/api_sevices.dart';
import 'package:lakini_gp/features/home/data/repos/home_repo_impl.dart';

final getit = GetIt.instance;
void setup() {
  getit.registerSingleton<HomeRepoImpl>(HomeRepoImpl(ApiService(Dio())));
}

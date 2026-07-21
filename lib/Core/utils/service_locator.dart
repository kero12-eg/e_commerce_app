import 'package:e_commerce_app/Core/networking/dio_helper.dart';
import 'package:e_commerce_app/Core/utils/storage_helper.dart';
import 'package:e_commerce_app/Features/Auth/cubit/auth_cubit.dart';
import 'package:e_commerce_app/Features/Auth/repo/auth_repo.dart';
import 'package:e_commerce_app/Features/main/home/Repo/home_repo.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;
void setupServiceLocator() {
  DioHelper dio = DioHelper();
  // diohelper
  sl.registerSingleton<DioHelper>(dio);
  // storage helper
  sl.registerLazySingleton(() => StorageHelper());
  // authrepo
  sl.registerLazySingleton(() => AuthRepo(sl<DioHelper>()));
  // home repo
  sl.registerLazySingleton(() => HomeRepo(sl<DioHelper>()));
  // cubit
  sl.registerFactory(() => AuthCubit(authRepo: sl<AuthRepo>()));
}
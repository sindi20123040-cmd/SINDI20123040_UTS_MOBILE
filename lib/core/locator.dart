// lib/core/locator.dart

import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../domain/splash_service.dart';
import '../domain/repositories/product_repository.dart';
import '../data/repositories/product_repository_impl.dart';
import '../presentation/cubit/product_cubit.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Splash Service
  locator.registerLazySingleton<SplashService>(() => SplashServiceImpl());

  // Dio & Repository Produk
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(locator<Dio>()),
  );

  // Cubit
  locator.registerFactory(() => ProductCubit(locator<ProductRepository>()));
}

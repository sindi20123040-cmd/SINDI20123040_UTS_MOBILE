// lib/core/locator.dart

import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

// Import domain & data
import '../domain/splash_service.dart';
import '../domain/repositories/product_repository.dart';
import '../data/repositories/product_repository_impl.dart';
import '../domain/repositories/bookmark_repository.dart';
import '../data/repositories/bookmark_repository_impl.dart';
import '../domain/crypto_service.dart';
import '../data/crypto_service_impl.dart';

// Import presentation & models
import '../presentation/cubit/product_cubit.dart';
import '../domain/models/isar_product.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // 1. Isar Database Setup
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([IsarProductSchema], directory: dir.path);
  locator.registerSingleton<Isar>(isar);

  // 2. Splash Service
  locator.registerLazySingleton<SplashService>(() => SplashServiceImpl());

  // 3. Network (Dio)
  locator.registerLazySingleton<Dio>(() => Dio());

  // 4. Repositories
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(locator<Dio>()),
  );
  locator.registerLazySingleton<BookmarkRepository>(
    () => BookmarkRepositoryImpl(locator<Isar>()),
  );

  // 5. Crypto Service (Untuk Isolate)
  locator.registerLazySingleton<CryptoService>(() => CryptoServiceImpl());

  // 6. Cubit (State Management)
  locator.registerFactory(() => ProductCubit(locator<ProductRepository>()));
}

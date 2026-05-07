import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../domain/splash_service.dart';
import '../domain/repositories/product_repository.dart';
import '../data/repositories/product_repository_impl.dart';
import '../domain/repositories/bookmark_repository.dart';
import '../data/repositories/bookmark_repository_impl.dart';
import '../presentation/cubit/product_cubit.dart';
import '../domain/models/isar_product.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // Isar Database Setup
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([IsarProductSchema], directory: dir.path);
  locator.registerSingleton<Isar>(isar);

  // Splash Service
  locator.registerLazySingleton<SplashService>(() => SplashServiceImpl());

  // Dio & Repositories
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(locator<Dio>()),
  );
  locator.registerLazySingleton<BookmarkRepository>(
    () => BookmarkRepositoryImpl(locator<Isar>()),
  );

  // Cubit
  locator.registerFactory(() => ProductCubit(locator<ProductRepository>()));
}

// lib/core/locator.dart

import 'package:get_it/get_it.dart';
import '../domain/splash_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Mendaftarkan SplashService agar tidak diinisialisasi manual (new) di UI
  locator.registerLazySingleton<SplashService>(() => SplashServiceImpl());
}

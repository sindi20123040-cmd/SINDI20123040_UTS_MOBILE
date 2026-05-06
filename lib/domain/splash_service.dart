// lib/domain/splash_service.dart

abstract class SplashService {
  Future<void> initializeApp();
}

class SplashServiceImpl implements SplashService {
  @override
  Future<void> initializeApp() async {
    // Logika Personal: Digit terakhir NIM 0 -> delay 5 detik
    // Dilakukan di layer Service sesuai syarat soal
    await Future.delayed(const Duration(seconds: 5));
  }
}

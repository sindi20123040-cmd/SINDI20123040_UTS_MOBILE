abstract class SplashService {
  Future<void> initializeApp();
}

class SplashServiceImpl implements SplashService {
  @override
  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 5));
  }
}

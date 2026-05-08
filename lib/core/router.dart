// lib/core/router.dart

import 'package:go_router/go_router.dart';
import '../presentation/pages/splash_page.dart';
import '../presentation/pages/main_screen.dart'; // Import MainScreen yang baru dibuat

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // Halaman pertama kali aplikasi dibuka (Splash Screen)
    GoRoute(path: '/', builder: (context, state) => const SplashPage()),

    // Halaman utama setelah Splash (Sekarang mengarah ke MainScreen)
    GoRoute(path: '/home', builder: (context, state) => const MainScreen()),
  ],
);

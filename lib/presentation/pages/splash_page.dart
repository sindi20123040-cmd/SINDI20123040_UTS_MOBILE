// lib/presentation/pages/splash_page.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/locator.dart';
import '../../domain/splash_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _startSplash();
  }

  Future<void> _startSplash() async {
    // Memanggil delay dari Service menggunakan get_it (locator)
    await locator<SplashService>().initializeApp();
    if (mounted) {
      // Pindah halaman menggunakan go_router
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'UTD Store Sindi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Logika Personal: Menampilkan Nama dan NIM di Splash Screen
            Text('Sindi Rahmadani', style: TextStyle(fontSize: 18)),
            Text('NIM: 20123040', style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            CircularProgressIndicator(), // Indikator loading
          ],
        ),
      ),
    );
  }
}

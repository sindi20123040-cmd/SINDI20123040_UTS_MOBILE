// lib/main.dart

import 'package:flutter/material.dart';
import 'core/locator.dart';
import 'core/router.dart';

void main() async {
  // 1. Tambahkan kata 'async' di sini
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Tambahkan 'await' karena setupLocator sekarang butuh waktu untuk buka database
  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'UTD Store Sindi',
      routerConfig: appRouter, // Hubungkan dengan go_router
    );
  }
}

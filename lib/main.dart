// lib/main.dart

import 'package:flutter/material.dart';
import 'core/locator.dart';
import 'core/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(); // Jalankan get_it
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

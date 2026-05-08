// lib/data/crypto_service_impl.dart

import 'dart:isolate';
import '../domain/crypto_service.dart';

class CryptoServiceImpl implements CryptoService {
  @override
  Future<double> calculateInvestment(double amount, int iterations) async {
    // Kita jalankan perhitungan berat di "Isolate" (jalur terpisah)
    // agar layar HP Sindi tidak macet saat menghitung
    return await Isolate.run(() {
      double result = amount;
      for (int i = 0; i < iterations; i++) {
        result += (i % 10);
      }
      return result;
    });
  }
}

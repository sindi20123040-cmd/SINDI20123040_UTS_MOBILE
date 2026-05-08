// lib/presentation/pages/crypto_page.dart

import 'package:flutter/material.dart';
import '../../core/locator.dart';
import '../../domain/crypto_service.dart';

class CryptoPage extends StatefulWidget {
  const CryptoPage({super.key});

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  double _result = 0;
  bool _isLoading = false;

  void _runHeavyTask() async {
    setState(() => _isLoading = true);

    // LOGIKA PERSONAL NIM: 20123040
    // Kita pakai 40 juta iterasi (dari 2 digit terakhir NIM) agar terasa "berat"
    final calculation = await locator<CryptoService>().calculateInvestment(
      1000,
      40000000,
    );

    setState(() {
      _result = calculation;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crypto Hub (Isolate)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.currency_bitcoin, size: 80, color: Colors.orange),
            const SizedBox(height: 20),
            Text(
              'Simulasi Investasi NIM 20123040',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            _isLoading
                ? const CircularProgressIndicator()
                : Text(
                    '\$ $_result',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _isLoading ? null : _runHeavyTask,
              child: const Text('Jalankan Hitungan Berat (Isolate)'),
            ),
          ],
        ),
      ),
    );
  }
}

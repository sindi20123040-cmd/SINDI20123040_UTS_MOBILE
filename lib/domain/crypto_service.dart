// lib/domain/crypto_service.dart

abstract class CryptoService {
  Future<double> calculateInvestment(double amount, int iterations);
}

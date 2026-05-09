// lib/data/repositories/product_repository_impl.dart

import 'package:dio/dio.dart';
import '../../domain/models/product.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final Dio dio;

  ProductRepositoryImpl(this.dio) {
    // Memasang Interceptor bawaan Dio
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await dio.get('https://fakestoreapi.com/products');

      List<Product> products = (response.data as List)
          .map((json) => Product.fromJson(json))
          .toList();

      // LOGIKA PERSONAL: NIM Sindi belakangnya 0 dan gratis ongkir
      return products.map((product) {
        return Product(
          id: product.id,
          title: '${product.title} [Promo Ongkir]',
          price: product.price,
          image: product.image,
        );
      }).toList();
    } catch (e) {
      throw Exception('Gagal mengambil data produk: $e');
    }
  }
}

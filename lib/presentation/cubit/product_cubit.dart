// lib/presentation/cubit/product_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/product.dart';
import '../../domain/repositories/product_repository.dart';

// State (Kondisi UI: Loading, Berhasil, atau Gagal)
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}

// Cubit (Pengelola Logika)
class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;

  ProductCubit(this.repository) : super(ProductInitial());

  void fetchProducts() async {
    emit(ProductLoading()); // Ubah state jadi loading
    try {
      final products = await repository.getProducts();
      emit(ProductLoaded(products)); // Jika sukses, tampilkan data
    } catch (e) {
      emit(ProductError(e.toString())); // Jika gagal, tampilkan error
    }
  }
}

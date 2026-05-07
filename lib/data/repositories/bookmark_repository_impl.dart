import 'package:isar/isar.dart';
import '../../../domain/models/isar_product.dart';
import '../../../domain/models/product.dart';
import '../../../domain/repositories/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final Isar isar;
  BookmarkRepositoryImpl(this.isar);

  @override
  Future<void> addBookmark(Product product) async {
    final newItem = IsarProduct()
      ..productId = product.id
      ..title = product.title
      ..price = product.price
      ..image = product.image;

    await isar.writeTxn(() => isar.isarProducts.put(newItem));
  }

  @override
  Future<void> removeBookmark(int productId) async {
    await isar.writeTxn(
      () =>
          isar.isarProducts.filter().productIdEqualTo(productId).deleteFirst(),
    );
  }

  @override
  Future<List<Product>> getBookmarks() async {
    final results = await isar.isarProducts.where().findAll();
    return results
        .map(
          (e) => Product(
            id: e.productId,
            title: e.title,
            price: e.price,
            image: e.image,
          ),
        )
        .toList();
  }

  @override
  Future<bool> isBookmarked(int productId) async {
    final count = await isar.isarProducts
        .filter()
        .productIdEqualTo(productId)
        .count();
    return count > 0;
  }
}

import '../models/product.dart';

abstract class BookmarkRepository {
  Future<void> addBookmark(Product product);
  Future<void> removeBookmark(int productId);
  Future<List<Product>> getBookmarks();
  Future<bool> isBookmarked(int productId);
}

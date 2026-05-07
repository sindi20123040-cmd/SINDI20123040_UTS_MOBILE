import 'isar/isar.dart';

part 'isar_product.g.dart';

@collection
class IsarProduct {
  Id id = Isar.autoIncrement; // ID otomatis dari Isar

  @Index(unique: true)
  late int productId; // ID asli dari API
  late String title;
  late double price;
  late String image;
}

import 'package:isar/isar.dart';

part 'isar_product.g.dart';

@collection
class IsarProduct {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int productId;
  late String title;
  late double price;
  late String image;
}

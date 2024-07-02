import 'package:veflat/domain/entities/product_entity.dart';

class CartProductEntity {
  final String size;
  final double price;
  final ProductEntity product;
  final int quantity;
  CartProductEntity({
    required this.product,
    required this.size,
    required this.price,
    required this.quantity,
  });

  static CartProductEntity fromProduct({
    required ProductEntity product,
    required String size,
    required double price,
    required int quantity,
  }) {
    return CartProductEntity(
      product: product,
      size: size,
      price: price,
      quantity: quantity,
    );
  }
}

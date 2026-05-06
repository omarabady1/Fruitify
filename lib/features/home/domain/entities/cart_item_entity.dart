import 'package:fruitify/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity product;
  int count;

  CartItemEntity({required this.product, required this.count});

  double get subTotal => product.price * count;

  void increaseCount() {
    count++;
  }

  void decreaseCount() {
    if (count > 1) {
      count--;
    }
  }

  num get quantity => product.amount * count;
}

import 'package:fruitify/core/entities/product_entity.dart';
import 'package:fruitify/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;
  CartEntity({required this.cartItems});

  double get totalPrice {
    double total = 0;
    for (var item in cartItems) {
      total += item.product.price * item.count;
    }
    return total;
  }

  addItem(CartItemEntity cartItem) {
    cartItems.add(cartItem);
  }

  removeItem(CartItemEntity cartItem) {
    cartItems.remove(cartItem);
  }

  bool isExist(ProductEntity productEntity) {
    return cartItems.any((element) => element.product == productEntity);
  }

  CartItemEntity findCartItem(ProductEntity productEntity) {
    return cartItems.firstWhere(
      (element) => element.product == productEntity,
      orElse: () => CartItemEntity(product: productEntity, count: 1),
    );
  }
}

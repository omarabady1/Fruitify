import 'package:fruitify/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;
  CartEntity({required this.cartItems});

  addItem(CartItemEntity cartItem) {
    cartItems.add(cartItem);
  }

  removeItem(CartItemEntity cartItem) {
    cartItems.remove(cartItem);
  }
}
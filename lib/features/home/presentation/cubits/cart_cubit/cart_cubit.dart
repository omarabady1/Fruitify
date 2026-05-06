import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/entities/product_entity.dart';
import 'package:fruitify/features/home/domain/entities/cart_entity.dart';
import 'package:fruitify/features/home/domain/entities/cart_item_entity.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartItems: []);

  void addToCart(ProductEntity productEntity) {
    if (cartEntity.isExist(productEntity)) {
      CartItemEntity cartItemEntity = cartEntity.findCartItem(productEntity);
      cartItemEntity.increaseCount();
    } else {
      cartEntity.addItem(CartItemEntity(product: productEntity));
    }
    emit(CartProductAdded());
  }

  void removeFromCart(CartItemEntity cartItem) {
    cartEntity.removeItem(cartItem);
    emit(CartProductRemoved());
  }
}

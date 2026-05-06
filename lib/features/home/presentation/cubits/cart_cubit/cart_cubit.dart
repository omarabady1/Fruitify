import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/features/home/domain/entities/cart_entity.dart';
import 'package:fruitify/features/home/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartItems: []);

  void addToCart(CartItemEntity cartItem) {
    cartEntity.addItem(cartItem);
    emit(CartAddedSuccessfully());
  }

  void removeFromCart(CartItemEntity cartItem) {
    cartEntity.removeItem(cartItem);
    emit(CartRemovedSuccessfully());
  }
}

part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartAddedSuccessfully extends CartState {}

final class CartRemovedSuccessfully extends CartState {}

final class CartFailed extends CartState {
  final String errorMessage;
  CartFailed(this.errorMessage);
}

part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartProductAdded extends CartState {}

final class CartProductRemoved extends CartState {}

final class CartProductCountUpdated extends CartState {}

final class CartFailed extends CartState {
  final String errorMessage;
  CartFailed(this.errorMessage);
}

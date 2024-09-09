part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

sealed class CartActionState extends CartState {}

class RemoveCartItemsMessage extends CartActionState {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<DataProductsModels> cartItems;

  CartSuccessState({required this.cartItems});
}


part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartIntialEvent extends CartEvent {}

class RemoveItemFromCart extends CartEvent {
  final DataProductsModels productsModels;

  RemoveItemFromCart({required this.productsModels});
}

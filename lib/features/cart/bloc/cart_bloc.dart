import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_project/data/cart_items.dart';
import 'package:flutter_bloc_project/features/Home/models/data_products_models.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartIntialEvent>(cartIntialEvent);
    on<RemoveItemFromCart>(removeItemFormCart);
  }

  FutureOr<void> cartIntialEvent(
      CartIntialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> removeItemFormCart(
      RemoveItemFromCart event, Emitter<CartState> emit) {
    cartItems.remove(event.productsModels);
    emit(CartSuccessState(cartItems: cartItems));
    emit(RemoveCartItemsMessage());
  }
}

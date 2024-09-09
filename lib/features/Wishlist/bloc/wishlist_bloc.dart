import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_project/data/wishlist_items.dart';
import 'package:flutter_bloc_project/features/Home/models/data_products_models.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListintialEvent>(wishListintialEvent);
  }

  FutureOr<void> wishListintialEvent(
      WishListintialEvent event, Emitter<WishlistState> emit) {
    emit(WishListSuccessState(wishlistitems: wishlistItems));
  }
}

part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishListintialEvent extends WishlistEvent {}

class RemoveItemFromWishList extends WishlistEvent{
  final DataProductsModels dataProductsModels;

  RemoveItemFromWishList({required this.dataProductsModels});
}


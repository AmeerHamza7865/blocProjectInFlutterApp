part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

class WishListSuccessState extends WishlistState {
  final List<DataProductsModels> wishlistitems;

  WishListSuccessState({required this.wishlistitems});
}

final class WishListedMessage extends WishlistActionState{} 
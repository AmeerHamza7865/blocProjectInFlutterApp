part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeIntialEvent extends HomeEvent {}

class HomeProductWishListButtonClickEvent extends HomeEvent {

final DataProductsModels clickProduct;

  HomeProductWishListButtonClickEvent({required this.clickProduct});

}

class HomeProductCartButtonClickEvent extends HomeEvent {

  final DataProductsModels clickProduct;

  HomeProductCartButtonClickEvent({required this.clickProduct});
}

class HomeWishListButtonNavigationEvent extends HomeEvent {}

class HomeCartButtonNavigationEvent extends HomeEvent {}

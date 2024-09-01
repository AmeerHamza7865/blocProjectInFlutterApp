import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_project/data/grocery_data.dart';
import 'package:flutter_bloc_project/features/Home/models/data_products_models.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeIntialEvent>(homeIntialEvent);
    on<HomeProductWishListButtonClickEvent>(
        homeProductWishListButtonClickEvent);
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);

    on<HomeWishListButtonNavigationEvent>(homeWishListButtonNavigationEvent);

    on<HomeCartButtonNavigationEvent>(homeCartButtonNavigationEvent);
  }

  // FutureOr<void> homeIntialEvent(
  //     HomeIntialEvent event, Emitter<HomeState> emit) async {
  //   emit(HomeLoadingState());
  //   await Future.delayed(Duration(seconds: 3));
  //   emit(
  //     HomeLoadedSuccessState(
  //       products: GroceryData.groceryData
  //           .map(
  //             (e) => DataProductsModels(
  //                 id: e['id'],
  //                 name: e['name'],
  //                 description: e['description'],
  //                 price: e['price'],
  //                 imageUrl: e['imageUrl']),
  //           )
  //           .toList(),
  //     ),
  //   );

  //   print(GroceryData.groceryData);
  //   emit(HomeErrorState());
  // }

  FutureOr<void> homeIntialEvent(
      HomeIntialEvent event, Emitter<HomeState> emit) async {
    // Emit loading state before starting any async operations
    emit(HomeLoadingState());

    try {
      // Simulate a delay or perform any setup required
      await Future.delayed(Duration(seconds: 3));

      // Process data and emit success state
      final products = GroceryData.groceryData
          .map(
            (e) => DataProductsModels(
              id: e['id'],
              name: e['name'],
              description: e['description'],
              price: e['price'],
              imageUrl: e['imageUrl'],
            ),
          )
          .toList();

      // Print data for debugging
      print(GroceryData.groceryData);

      // Emit the success state with the loaded products
      emit(HomeLoadedSuccessState(products: products));
    } catch (error) {
      // Print the error for debugging purposes
      print('Error occurred: $error');

      // Emit error state with a meaningful message if needed
      emit(HomeErrorState());
    }
  }

  FutureOr<void> homeProductWishListButtonClickEvent(
      HomeProductWishListButtonClickEvent event, Emitter<HomeState> emit) {
    print("WishList Product is Clicked");
  }

  FutureOr<void> homeProductCartButtonClickEvent(
      HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
    print("Cart Product is Clicked");
  }

  FutureOr<void> homeWishListButtonNavigationEvent(
      HomeWishListButtonNavigationEvent event, Emitter<HomeState> emit) {
    print("WishList Navigation is Clicked");
    emit(HomeNigateToWishListPageActionState());
  }

  FutureOr<void> homeCartButtonNavigationEvent(
      HomeCartButtonNavigationEvent event, Emitter<HomeState> emit) {
    print("Cart Navigation is Clicked");
    emit(HomeNigateToCartPageActionState());
  }
}

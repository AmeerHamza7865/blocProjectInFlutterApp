import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/features/Wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_project/features/Wishlist/ui/wishlist_tile.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});
  
  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishListintialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist Items"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {
           if (state is WishListedMessage) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("item is removed from Wishlist")));
          }

        },
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishListSuccessState:
              final successState = state as WishListSuccessState;
              return ListView.builder(
                itemCount: successState.wishlistitems.length,
                itemBuilder: (context, index) {
                  return WishListTile(
                    productsModels: successState.wishlistitems[index],
                    wishlistBloc: wishlistBloc,
                  );
                },
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_project/features/cart/ui/cart_title.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartIntialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Items"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {
          if (state is RemoveCartItemsMessage) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("item is removed from Cart")));
          }
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final SuccessState = state as CartSuccessState;
              return ListView.builder(
                itemCount: SuccessState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTile(
                    productsModels: SuccessState.cartItems[index],
                    cartBloc: cartBloc,
                  );
                },
              );

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}

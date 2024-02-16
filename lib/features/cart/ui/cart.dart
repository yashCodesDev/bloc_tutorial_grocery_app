import 'package:bloc_tutorial/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:bloc_tutorial/features/cart/ui/cart_tile_widget.dart';
import 'package:bloc_tutorial/features/home/ui/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBlocBloc cartBloc = CartBlocBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
        backgroundColor: Colors.teal,
      ),
      body: Scaffold(
        body: BlocConsumer<CartBlocBloc, CartBlocState>(
          bloc: cartBloc,
          listener: (BuildContext context, CartBlocState state) {
            if (state is CartRemoveActionState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Item removed from cart')));
            }
          },
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case CartSuccessState:
                final successState = state as CartSuccessState;
                return ListView.builder(
                    itemCount: successState.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartTileWidget(
                        productDataModel: successState.cartItems[index],
                        cartBloc: cartBloc,
                      );
                    });

              default:
            }
            return Container();
          },
        ),
      ),
    );
  }
}

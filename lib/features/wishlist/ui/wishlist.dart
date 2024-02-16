import 'package:bloc_tutorial/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:bloc_tutorial/features/wishlist/bloc/wishlist_bloc_bloc.dart';
import 'package:bloc_tutorial/features/wishlist/ui/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBlocBloc wishListBloc = WishlistBlocBloc();
  @override
  void initState() {
    wishListBloc.add(WishlistInitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBlocBloc, WishlistBlocState>(
      bloc: wishListBloc,
      listener: (context, state) {
        if (state is WishlistBlocActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item removed from wishlist')));
        }
      },
      listenWhen: (previous, current) => current is WishlistBlocActionState,
      buildWhen: (previous, current) => current is! WishlistBlocActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case WishlistSuccessState:
            final successState = state as WishlistSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('WishList Items'),
                backgroundColor: Colors.teal,
              ),
              body: ListView.builder(
                  itemCount: successState.wishListItems.length,
                  itemBuilder: (context, index) {
                    return WishListTileWidget(
                      productDataModel: successState.wishListItems[index],
                      wishListBloc: wishListBloc,
                    );
                  }),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}

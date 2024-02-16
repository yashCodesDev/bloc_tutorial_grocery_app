import 'package:bloc_tutorial/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:bloc_tutorial/features/home/models/home_product_data.dart';
import 'package:bloc_tutorial/features/wishlist/bloc/wishlist_bloc_bloc.dart';
import 'package:flutter/material.dart';

class WishListTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBlocBloc wishListBloc;
  const WishListTileWidget(
      {super.key, required this.productDataModel, required this.wishListBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productDataModel.imageUrl),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(height: 20),
          Text(
            productDataModel.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(productDataModel.description),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${productDataModel.price}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      print("Wishlist Product Clicked");
                      // cartBloc.add(HomeProductWishlistButtonClickedEvent(
                      //     clickedProduct: productDataModel));
                      wishListBloc.add(RemoveFromWishlistEvent(
                          productDataModel: productDataModel));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Item removed from wishlist'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.favorite),
                    style: const ButtonStyle(
                        iconColor: MaterialStatePropertyAll(Colors.red)),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag_outlined),
                    style: const ButtonStyle(
                        iconColor: MaterialStatePropertyAll(Colors.black)),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

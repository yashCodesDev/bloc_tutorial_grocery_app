import 'package:bloc_tutorial/features/home/bloc/home_bloc_bloc.dart';
import 'package:bloc_tutorial/features/home/models/home_product_data.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBlocBloc homeBloc;
  const ProductTileWidget(
      {super.key, required this.productDataModel, required this.homeBloc});

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
                    fit: BoxFit.contain)),
          ),
          const SizedBox(height: 20),
          Text(
            productDataModel.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(productDataModel.description),
          const SizedBox(height: 10),
          const Divider(),
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
                      print("Cart Product Clicked");
                      homeBloc.add(HomeProductWishlistButtonClickedEvent(
                          clickedProduct: productDataModel));
                    },
                    icon: const Icon(Icons.favorite_border),
                    style: const ButtonStyle(
                        iconColor: MaterialStatePropertyAll(Colors.black)),
                  ),
                  IconButton(
                    onPressed: () {
                      print("Cart Product Clicked");
                      homeBloc.add(HomeProductCartButtonClickedEvent(
                          clickedProduct: productDataModel));
                    },
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

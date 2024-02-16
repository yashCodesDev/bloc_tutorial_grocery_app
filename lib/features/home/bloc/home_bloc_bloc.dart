import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/data/cart_items.dart';
import 'package:bloc_tutorial/data/grocery_data.dart';
import 'package:bloc_tutorial/data/wishlist_item.dart';
import 'package:bloc_tutorial/features/home/models/home_product_data.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeBlocState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event,
      Emitter<HomeBlocState> emit) {
    print('Wishlist Product Clicked');
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemsWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeBlocState> emit) {
    print('Cart Product Clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemsCartActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    print('Wishlist Navigate Clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    print('Cart Navigate Clicked');
    emit(HomeNavigateToCartPageActionState());
  }
}

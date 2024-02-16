import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/data/wishlist_item.dart';
import 'package:bloc_tutorial/features/home/models/home_product_data.dart';
import 'package:meta/meta.dart';

part 'wishlist_bloc_event.dart';
part 'wishlist_bloc_state.dart';

class WishlistBlocBloc extends Bloc<WishlistBlocEvent, WishlistBlocState> {
  WishlistBlocBloc() : super(WishlistBlocInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<RemoveFromWishlistEvent>(removeFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistBlocState> emit) {
    emit(WishlistSuccessState(wishListItems: wishlistItems));
  }

  FutureOr<void> removeFromWishlistEvent(
      RemoveFromWishlistEvent event, Emitter<WishlistBlocState> emit) {
    wishlistItems.remove(event.productDataModel);
    emit(WishlistSuccessState(wishListItems: wishlistItems));
  }
}

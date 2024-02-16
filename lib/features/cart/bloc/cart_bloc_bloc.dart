import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/data/cart_items.dart';
import 'package:bloc_tutorial/features/home/models/home_product_data.dart';
import 'package:meta/meta.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartBlocState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartBlocState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartSuccessState(cartItems: cartItems));
  }
}

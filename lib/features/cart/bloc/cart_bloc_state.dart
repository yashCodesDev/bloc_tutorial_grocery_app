part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocState {}

sealed class CartActionState {}

final class CartBlocInitial extends CartBlocState {}

class CartSuccessState extends CartBlocState {
  final List<ProductDataModel> cartItems;

  CartSuccessState({required this.cartItems});
}

class CartRemoveActionState extends CartActionState {
  final List<ProductDataModel> cartItems;

  CartRemoveActionState({required this.cartItems});
}

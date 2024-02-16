part of 'wishlist_bloc_bloc.dart';

@immutable
sealed class WishlistBlocState {}

sealed class WishlistBlocActionState {}

final class WishlistBlocInitial extends WishlistBlocState {}

final class WishlistSuccessState extends WishlistBlocState {
  final List<ProductDataModel> wishListItems;

  WishlistSuccessState({required this.wishListItems});
}

final class RemoveFromWishlistState extends WishlistBlocActionState {
  final List<ProductDataModel> wishListItems;

  RemoveFromWishlistState({required this.wishListItems});
}

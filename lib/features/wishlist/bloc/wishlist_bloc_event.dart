part of 'wishlist_bloc_bloc.dart';

@immutable
sealed class WishlistBlocEvent {}

class WishlistInitialEvent extends WishlistBlocEvent {}

class RemoveFromWishlistEvent extends WishlistBlocEvent {
  final ProductDataModel productDataModel;

  RemoveFromWishlistEvent({required this.productDataModel});
}

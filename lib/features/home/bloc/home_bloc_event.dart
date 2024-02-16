part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeBlocEvent {
  final ProductDataModel clickedProduct;

  HomeProductWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickedEvent extends HomeBlocEvent {
  final ProductDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeWishlistButtonNavigateEvent extends HomeBlocEvent {}

class HomeCartButtonNavigateEvent extends HomeBlocEvent {}

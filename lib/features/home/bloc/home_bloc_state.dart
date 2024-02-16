part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}

sealed class HomeBlocActionState extends HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

class HomeLoadingState extends HomeBlocState {}

class HomeLoadedSuccessState extends HomeBlocState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeBlocState {}

class HomeNavigateToWishlistPageActionState extends HomeBlocActionState {}

class HomeNavigateToCartPageActionState extends HomeBlocActionState {}

class HomeProductItemsWishlistedActionState extends HomeBlocActionState {}

class HomeProductItemsCartActionState extends HomeBlocActionState {}

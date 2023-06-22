part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeProductWishlistButtonClickEvent extends HomeEvent {}

class HomeProductCartButtonClickEvent extends HomeEvent {}

class HomeProductWishlistButtonNavigateEvent extends HomeEvent {}

class HomeProductCartButtonBavigateEvent extends HomeEvent {}

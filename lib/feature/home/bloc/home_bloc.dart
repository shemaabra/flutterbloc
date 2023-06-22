import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductWishlistButtonClickEvent>(
        homeProductWishlistButtonClickEvent);
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);

    on<HomeProductWishlistButtonNavigateEvent>(
        homeProductWishlistButtonNavigateEvent);

    on<HomeProductCartButtonBavigateEvent>(homeProductCartButtonBavigateEvent);
  }

  FutureOr<void> homeProductWishlistButtonClickEvent(
      HomeProductWishlistButtonClickEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeProductCartButtonClickEvent(
      HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeProductWishlistButtonNavigateEvent(
      HomeProductWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("wishlist clicked!");
  }

  FutureOr<void> homeProductCartButtonBavigateEvent(
      HomeProductCartButtonBavigateEvent event, Emitter<HomeState> emit) {
    print("cart clicked!");
  }
}

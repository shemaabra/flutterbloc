import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_static_example/data/cart_item.dart';
import 'package:bloc_static_example/data/wishlist_item.dart';
import 'package:meta/meta.dart';

import '../../../data/grocery_data.dart';
import '../../../models/home_product_data.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickEvent>(
        homeProductWishlistButtonClickEvent);
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);

    on<HomeProductWishlistButtonNavigateEvent>(
        homeProductWishlistButtonNavigateEvent);

    on<HomeProductCartButtonBavigateEvent>(homeProductCartButtonBavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadingSuccessState(
        products: GroceryData.groceryProduct
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickEvent(
      HomeProductWishlistButtonClickEvent event, Emitter<HomeState> emit) {
    print("Add Product to wishlist");
    wishListItems.add(event.clickedProduct);
    emit(HomeProductItemWishListedActionState());
  }

  FutureOr<void> homeProductCartButtonClickEvent(
      HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
    print("Add product to cart!");
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeProductWishlistButtonNavigateEvent(
      HomeProductWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("wishlist clicked! navigator");
    emit(HomeNavigateProductWishlistPageActionState());
  }

  FutureOr<void> homeProductCartButtonBavigateEvent(
      HomeProductCartButtonBavigateEvent event, Emitter<HomeState> emit) {
    print("cart clicked! navigator");
    emit(HomeNavigateProductCartPageActionState());
  }
}

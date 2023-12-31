import 'package:bloc_static_example/feature/cart/ui/cart.dart';
import 'package:bloc_static_example/feature/home/ui/product_tile_widget.dart';
import 'package:bloc_static_example/feature/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateProductCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Cart(),
            ),
          );
        } else if (state is HomeNavigateProductWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WishList(),
            ),
          );
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Item Carted")));
        } else if (state is HomeProductItemWishListedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Items Wishlisted")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadingSuccessState:
            final successState = state as HomeLoadingSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Grocery App",
                  style: GoogleFonts.montserrat(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                backgroundColor: Colors.teal,
                elevation: 0.0,
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWishlistButtonNavigateEvent());
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductCartButtonBavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_bag_outlined,
                        color: Colors.white),
                  ),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWIdget(
                      productDataModel: successState.products[index],
                      homeBloc: homeBloc,
                    );
                  }),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

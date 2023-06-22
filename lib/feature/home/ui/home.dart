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
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      // listenWhen: (previous, current) {},
      listener: (context, state) {},
      // buildWhen: (previous, current) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Grocery App",
              style: GoogleFonts.montserrat(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.teal,
            elevation: 0.0,
            actions: [
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeProductWishlistButtonNavigateEvent());
                },
                icon: const Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeProductCartButtonBavigateEvent());
                },
                icon: const Icon(Icons.shopping_bag_outlined),
              )
            ],
          ),
        );
      },
    );
  }
}

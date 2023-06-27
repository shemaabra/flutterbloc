import 'package:bloc_static_example/models/home_product_data.dart';
import 'package:flutter/material.dart';

class ProductTileWIdget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const ProductTileWIdget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          Text(productDataModel.name),
          Text(productDataModel.description),
        ],
      ),
    );
  }
}

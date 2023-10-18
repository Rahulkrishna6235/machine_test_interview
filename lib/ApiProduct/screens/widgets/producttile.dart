import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../modal/productmodal.dart';
class ProductTile extends StatelessWidget {
  final Productmodal product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: CachedNetworkImage(
              imageUrl: product.images ,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            product.title!,
            maxLines: 2,
            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('\$${product.price}',
              style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
          SizedBox(height: 8),
          Text(
            product.description!,
            maxLines: 2,
            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

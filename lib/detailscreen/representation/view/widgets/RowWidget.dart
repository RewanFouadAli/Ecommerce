import 'package:ecommerce_app/model/category.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({Key? key, required this.product}) : super(key: key);
  final Category product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amber,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          product.rating?.rate?.toString() ?? "",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          "(${product.rating?.count?.toString() ?? ''} )",
          style: TextStyle(color: Colors.black, fontSize: 15),
        )
      ],
    );
  }
}

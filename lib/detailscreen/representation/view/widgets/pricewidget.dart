import 'package:ecommerce_app/model/category.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key, required this.product}) : super(key: key);
  final Category product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              "New",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "\$${product.price.toString() ?? '-'}",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

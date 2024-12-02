import 'package:ecommerce_app/detailscreen/representation/view/widgets/RowWidget.dart';
import 'package:ecommerce_app/detailscreen/representation/view/widgets/pricewidget.dart';
import 'package:ecommerce_app/home/representation/view/home.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.product}) : super(key: key);

  final Category product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height / 3,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRect(
                    child: Image.network(
                      product.image ?? "",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              // السهم
              Positioned(
                left: 10,
                top: 20,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          RatingWidget(product: product),
          SizedBox(height: 5),
          PriceWidget(product: product),
          SizedBox(height: 10),
          Text(
            product.title ?? '',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            product.description ?? '',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

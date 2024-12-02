import 'package:ecommerce_app/detailscreen/representation/view/detailscreen.dart';
import 'package:ecommerce_app/home/representation/view/widgets/add.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:flutter/material.dart';

class GetProducts extends StatelessWidget {
  final List<Category> products;

  GetProducts({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: .6,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          Category product = products[index];

          double rating = product.rating?.rate ?? 0;
          int fullStars = rating.floor();
          bool hasHalfStar = (rating - fullStars) >= 0.5;
          int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    product: product,
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 10),
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      product.image!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.title!,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "\$${product.price}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < fullStars; i++)
                        Icon(Icons.star, color: Colors.orange, size: 16),
                      if (hasHalfStar)
                        Icon(Icons.star_half, color: Colors.orange, size: 16),
                      for (int i = 0; i < emptyStars; i++)
                        Icon(Icons.star_border, color: Colors.orange, size: 16),
                      SizedBox(width: 40),
                    ],
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: AddButton(
                        index: index,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

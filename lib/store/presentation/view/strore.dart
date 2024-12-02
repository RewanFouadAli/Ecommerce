import 'package:ecommerce_app/home/representation/view/home.dart';
import 'package:ecommerce_app/home/representation/view/widgets/bottomnav.dart';
import 'package:ecommerce_app/home/representation/viewmodel/cubit/home_cubit.dart';
import 'package:ecommerce_app/home/representation/viewmodel/cubit/home_state.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is SuccessState) {
          final selectedProducts = context.read<HomeCubit>().selectedProduct;

          if (selectedProducts.isNotEmpty) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Store',
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FixedBottomNavExample()),
                    );
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: ListView.builder(
                  itemCount: selectedProducts.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final product = selectedProducts[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    product.image ??
                                        'https://via.placeholder.com/150',
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    product.title ?? 'No Title',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Price: \$${product.price ?? '0.00'}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      context
                                          .read<HomeCubit>()
                                          .removeItem(product);
                                    },
                                    icon: Icon(Icons.remove))
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Store',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (_) => HomeCubit()..datamodel(),
                        child: FixedBottomNavExample(),
                      ),
                    ),
                  );
                },
              ),
            ),
            body: Center(
              child: Text('No products added to the store yet.'),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Store',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (_) => HomeCubit()..datamodel(),
                      child: FixedBottomNavExample(),
                    ),
                  ),
                );
              },
            ),
          ),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

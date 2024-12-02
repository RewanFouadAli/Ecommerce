import 'package:ecommerce_app/home/representation/view/getproducts.dart';
import 'package:ecommerce_app/home/representation/view/widgets/backgroundwidget.dart';
import 'package:ecommerce_app/home/representation/view/widgets/carousal_slider.dart';
import 'package:ecommerce_app/home/representation/viewmodel/cubit/home_cubit.dart';
import 'package:ecommerce_app/home/representation/viewmodel/cubit/home_state.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/home/representation/view/widgets/carousal_slider.dart';
import 'package:ecommerce_app/home/representation/viewmodel/cubit/home_cubit.dart';
import 'package:ecommerce_app/home/representation/viewmodel/cubit/home_state.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, String>> images = [
    {'image': 'assets/images/shirt (1).png', 'category': "men's clothing"},
    {'image': 'assets/images/dress (1).png', 'category': "women's clothing"},
    {'image': 'assets/images/wedding-ring.png', 'category': 'jewelery'},
    {'image': 'assets/images/device.png', 'category': 'electronics'}
  ];

  var selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().datamodel();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<HomeCubit>()
          .filterByCategory(images[selectedIndex]['category']!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BackGround(
              listView: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });

                        context
                            .read<HomeCubit>()
                            .filterByCategory(images[index]['category']!);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26, blurRadius: 5),
                                ],
                              ),
                              child: Image.asset(
                                images[index]['image']!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            CarouselWithDots(),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is SuccessState) {
                  return GetProducts(
                    products: state.categoryList,
                  );
                } else if (state is ErrorState) {
                  return Center(child: Text("Something went wrong"));
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce_app/home/representation/viewmodel/cubit/home_cubit.dart';
import 'package:ecommerce_app/home/representation/viewmodel/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BackGround extends StatelessWidget {
  final Widget? listView;

  const BackGround({Key? key, this.listView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.29,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF5C6BC0),
            Color(0xFF64B5F6),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    "Good day for shopping",
                    style: TextStyle(color: Colors.white.withOpacity(.7)),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Stack(
                      children: [
                        Icon(
                          Icons.badge_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                              int num = 0;
                              if (state is SuccessState) {
                                num = state.totalCount;
                              }

                              return Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '$num',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Showcase Styles",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Popular Categories",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
            if (listView != null) listView!,
          ],
        ),
      ),
    );
  }
}

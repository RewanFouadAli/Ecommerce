import 'package:ecommerce_app/home/representation/viewmodel/cubit/home_cubit.dart';
import 'package:ecommerce_app/home/representation/viewmodel/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddButton extends StatelessWidget {
  final int index;

  const AddButton({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<HomeCubit>().incrementItemCount(index);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is SuccessState) {
                return Text(
                  state.categoryList[index].count.toString(),
                  style: TextStyle(color: Colors.white),
                );
              }
              return Text(
                "0",
                style: TextStyle(color: Colors.white),
              );
            },
          ),
        ),
      ),
    );
  }
}

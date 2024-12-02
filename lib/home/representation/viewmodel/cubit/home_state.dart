import 'package:ecommerce_app/model/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

abstract class HomeState {}

class InitialState extends HomeState {}

class LoadingState extends HomeState {}

class SuccessState extends HomeState {
  final List<Category> categoryList;
  final int totalCount;

  SuccessState({required this.categoryList, required this.totalCount});
}

class SelectedProductState extends HomeState {
  final List<Category> categoryList;
  final int totalCount;
  final List<Category> selectedProduct;

  SelectedProductState({
    required this.categoryList,
    required this.totalCount,
    required this.selectedProduct,
  });
}

class TotalSum extends HomeState {
  int totalsum;
  TotalSum(this.totalsum);
}

class ErrorState extends HomeState {
  final String message;

  ErrorState(this.message);
}

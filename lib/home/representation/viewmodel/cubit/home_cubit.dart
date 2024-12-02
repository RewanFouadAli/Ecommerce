import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import 'package:ecommerce_app/home/representation/viewmodel/cubit/home_state.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());

  List<Category> _categoryList = [];
  List<Category> _filteredCategoryList = [];
  int _totalCount = 0;
  List<Category> selectedProduct = [];

  Future<void> datamodel() async {
    emit(LoadingState());
    try {
      final dio = Dio();
      final response = await dio.get("https://fakestoreapi.com/products");

      List<Category> newCategoryList = (response.data as List)
          .map((item) => Category.fromJson(item))
          .toList();

      _categoryList = newCategoryList.map((product) {
        final existingProduct = selectedProduct.firstWhere(
          (p) => p.id == product.id,
          orElse: () => product,
        );
        return existingProduct;
      }).toList();

      _filteredCategoryList = _categoryList
          .where((product) => product.category == _categoryList.first.category)
          .toList();

      emit(SuccessState(
        categoryList: _filteredCategoryList,
        totalCount: _totalCount,
      ));
    } catch (error) {
      emit(ErrorState("Something went wrong"));
    }
  }

  void filterByCategory(String category) {
    _filteredCategoryList =
        _categoryList.where((product) => product.category == category).toList();
    emit(SuccessState(
      categoryList: _filteredCategoryList,
      totalCount: _totalCount,
    ));
  }

  void incrementItemCount(int index) {
    _filteredCategoryList[index].count++;
    _totalCount++;

    if (!selectedProduct.contains(_filteredCategoryList[index])) {
      selectedProduct.add(_filteredCategoryList[index]);
    }

    emit(SuccessState(
      categoryList: _filteredCategoryList,
      totalCount: _totalCount,
    ));
  }

  void decrementItemCount(int index) {
    if (_filteredCategoryList[index].count > 0) {
      _filteredCategoryList[index].count--;
      _totalCount--;

      if (_filteredCategoryList[index].count == 0) {
        selectedProduct.remove(_filteredCategoryList[index]);
      }

      emit(SelectedProductState(
          categoryList: _filteredCategoryList,
          totalCount: _totalCount,
          selectedProduct: selectedProduct));
    }
  }

  void removeItem(Category item) {
    if (selectedProduct.contains(item)) {
      _totalCount -= item.count;
      selectedProduct.remove(item);
      emit(SuccessState(
        categoryList: _filteredCategoryList,
        totalCount: _totalCount,
      ));
    }
  }
}

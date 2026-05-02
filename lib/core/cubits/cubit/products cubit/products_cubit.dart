import 'package:flutter/foundation.dart';
import 'package:fruitify/core/entities/product_entity.dart';
import 'package:fruitify/core/repos/product_repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());

  final ProductRepo productRepo;

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    var result = await productRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductsFailure(error: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }

  Future<void> getProducts() async {
    emit(ProductsLoading());
    var result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(error: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }
}

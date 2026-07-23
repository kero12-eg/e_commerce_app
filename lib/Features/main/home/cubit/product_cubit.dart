import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/main/home/Repo/home_repo.dart';
import 'package:e_commerce_app/Features/main/home/cubit/product_state.dart';
import 'package:e_commerce_app/Features/main/home/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this._homeRepo}) : super(ProductInitial());
  final HomeRepo _homeRepo;

  Future<void> getProducts() async {
    emit(ProductLoading());
    final Either<String, List<ProductModel>> res = await _homeRepo
        .getProducts();
    res.fold(
      (error) {
        emit(ProductError(error));
      },
      (right) {
        emit(ProductLoaded(right));
      },
    );
  }
  Future<void> getproductcategory(int id) async {
    emit(ProductLoading());
    final Either<String, List<ProductModel>> res = await _homeRepo
        .getproductcategory(id);
    res.fold(
      (error) {
        emit(ProductError(error));
      },
      (right) {
        emit(ProductLoaded(right));
      },
    );
  }
  Future<void> getproductsearchbyname(String name) async {
    emit(ProductLoading());
    final Either<String, List<ProductModel>> res = await _homeRepo
        .getproductsearchbyname(name);
    res.fold(
      (error) {
        emit(ProductError(error));
      },
      (right) {
        emit(ProductLoaded(right));
      },
    );
  }
}

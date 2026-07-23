import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/main/home/Repo/home_repo.dart';
import 'package:e_commerce_app/Features/main/home/cubit/category_state.dart';
import 'package:e_commerce_app/Features/main/home/models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this._homeRepo}) : super(CategoryInitial());
  final HomeRepo _homeRepo;
  void getCategories() async {
    emit(CategoryLoading());
    final Either<String, List<CategoryModel>> res = await _homeRepo
        .getCategories();
    res.fold(
      (error) {
        emit(CategoryError(error: error));
      },
      (right) {
        emit(CategoryLoaded(categories: right));
      },
    );
  }
}

import 'package:e_commerce_app/Features/main/home/models/category_model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryModel> categories;
  CategoryLoaded({required this.categories});
}

class CategoryError extends CategoryState {
  final String error;
  CategoryError({required this.error});
}
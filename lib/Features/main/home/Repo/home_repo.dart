import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/networking/api_endpoints.dart';
import 'package:e_commerce_app/Core/networking/dio_helper.dart';
import 'package:e_commerce_app/Features/main/home/models/category_model.dart';
import 'package:e_commerce_app/Features/main/home/models/product_model.dart';

class HomeRepo {
  final DioHelper _dioHelper;

  HomeRepo(this._dioHelper);
  Future<Either<String, List<CategoryModel>>> getCategories() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.categories,
      );
      if (response.statusCode == 200 ) {
        List<CategoryModel> categories = categoryModelFromJson(response.data);
        categories.insert(0, CategoryModel(id: 0, name: "All"));
        return Right(categories);
      }
      else {
        return Left("Something went wrong");
      }
      
      
    }
    catch (error) {
      return Left(error.toString());
    }
}
Future <Either<String, List<ProductModel>>> getProducts() async{
  try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.products,
      );
      if (response.statusCode == 200 ) {
        List<ProductModel> products = productModelFromJson(response.data);
        return Right(products);
      }
      else {
        return Left("Something went wrong");
      }
      
      
    }
    catch (error) {
      return Left(error.toString());
    }
}
 // getproductcategory
 Future <Either<String, List<ProductModel>>> getproductcategory(int id) async{
   try {
      final response = await _dioHelper.getRequest(
        endPoint: '${ApiEndpoints.categories}/$id/products',
      );
      if (response.statusCode == 200 ) {
        List<ProductModel> products = productModelFromJson(response.data);
        return Right(products);
      }
      else {
        return Left("Something went wrong");
      }
      
      
    }
    catch (error) {
      return Left(error.toString());
    }
   
 }
 Future <Either<String, List<ProductModel>>> getproductsearchbyname(String name) async{
   try {
      final response = await _dioHelper.getRequest(
        query: {
          'title': name
        },
        endPoint: ApiEndpoints.products,
      );
      if (response.statusCode == 200 ) {
        List<ProductModel> products = productModelFromJson(response.data);
        return Right(products);
      }
      else {
        return Left("Something went wrong");
      }
      
      
    }
    catch (error) {
      return Left(error.toString());
    }
 }
}


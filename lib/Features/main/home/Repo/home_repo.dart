import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/networking/api_endpoints.dart';
import 'package:e_commerce_app/Core/networking/dio_helper.dart';
import 'package:e_commerce_app/Features/main/home/models/category_model.dart';

class HomeRepo {
  final DioHelper _dioHelper;

  HomeRepo(this._dioHelper);
  Future<Either<String, List<CategoryModel>>> getCategories() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.login,
      );
      if (response.statusCode == 200 ) {
        List<CategoryModel> categories = categoryModelFromJson(response.data);
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
}


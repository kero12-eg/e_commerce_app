import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/networking/api_endpoints.dart';
import 'package:e_commerce_app/Core/networking/dio_helper.dart';
import 'package:e_commerce_app/Features/Auth/model/login_response_model.dart';

class AuthRepo {
  Future<Either<String, LoginResponseModel>> login(String email, String password) async {
    final response = await DioHelper.postRequest(
      endPoint: ApiEndpoints.login,
      data: {"email": email, "password": password},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(response.data);
      return Right(loginResponseModel);
    }
    else{
        return Left(response.data["message"].toString());
    }
  }
}

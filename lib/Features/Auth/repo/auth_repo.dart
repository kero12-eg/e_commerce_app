import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/Core/networking/api_endpoints.dart';
import 'package:e_commerce_app/Core/networking/dio_helper.dart';
import 'package:e_commerce_app/Core/utils/service_locator.dart';
import 'package:e_commerce_app/Core/utils/storage_helper.dart';
import 'package:e_commerce_app/Features/Auth/model/login_response_model.dart';
import 'package:e_commerce_app/Features/Auth/model/register_response_model.dart';

class AuthRepo {
  final DioHelper _dioHelper;
  AuthRepo(this._dioHelper);
  Future<Either<String, LoginResponseModel>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await _dioHelper.postRequest(
        endPoint: ApiEndpoints.login,
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
          response.data,
        );
        sl<StorageHelper>().saveaccessToken(loginResponseModel.accesstoken);
        sl<StorageHelper>().saverefreshToken(loginResponseModel.refreshtoken);
        return Right(loginResponseModel);
      } else {
        return Left(response.data["message"].toString());
      }
    } catch (error) {
      if (error is DioException) {
        return Left(error.response!.data["message"].toString());
      }
      return Left(error.toString());
    }
  }

  Future<Either<String, RegisterResponseModel>> register({
    required String email,
    required String password,
    required String name,
    required String avatar,
  }) async {
    try {
      final response = await _dioHelper.postRequest(
        endPoint: ApiEndpoints.users,
        data: {
          "email": email,
          "password": password,
          "name": name,
          "avatar": avatar,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        RegisterResponseModel registerResponseModel =
            RegisterResponseModel.fromJson(response.data);
        return Right(registerResponseModel);
      } else {
        return Left(response.data["message"].toString());
      }
    } catch (error) {
      if (error is DioException) {
        return Left(error.response!.data["message"].toString());
      }
      return Left(error.toString());
    }
  }
}

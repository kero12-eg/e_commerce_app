import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/Core/networking/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;

  static void initDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    dio!.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }

  static getRequest({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      return await dio!.get(
        endPoint,
        queryParameters: query,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  static postRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      return await dio!.post(
        endPoint,
        data: data,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  static putRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      return await dio!.put(
        endPoint,
        data: data,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  static deleteRequest({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      return await dio!.delete(
        endPoint,
        data: data,
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
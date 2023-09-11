import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'app_exceptions.dart';
import 'api_url.dart';
class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
        BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }
  /// Get Function ///

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? params,
  }) async {
    try {
      // init().options.headers = {
      //   'Authorization': 'Bearer $token}',
      // };
      return await dio.get(url, queryParameters: params);
    } on SocketException {
      throw AppExceptions('Problem with internet connection.');
    } on HandshakeException {
      throw AppExceptions('Your have a problem in internet connection');
    } on TimeoutException {
      throw AppExceptions('Problem with internet connection.');
    } on DioException catch (e) {
      debugPrint(e.message.toString(), wrapWidth: 100);
      debugPrint(e.response.toString(), wrapWidth: 100);
      String errorMsg = _returnResponse(e.response!);
      debugPrint(errorMsg, wrapWidth: 100);
    }
    return null;
  }

  /// function to handle response ///

  static dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.data.toString());
        return responseJson;
      case 400:
        throw returnErrors(response);
      case 422:
        throw AppExceptions('Error occurred while Communication');
      case 401:
      case 403:
      case 404:
        throw AppExceptions(
            "The email or password you've entered is incorrect");
      case 500:
      default:
        throw AppExceptions('Error occurred while Communication');
    }
  }
}

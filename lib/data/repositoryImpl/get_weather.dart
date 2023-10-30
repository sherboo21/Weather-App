import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gst_task/presentation/screens/home/cubit/home_cubit.dart';
import '../dataSources/remote/api_url.dart';
import '../dataSources/remote/dio.dart';
import 'get_current_location.dart';

class GetWeatherRepositoryImpl{

  /// get weather function ///
  Future<dynamic>? getWeather(
      {required void Function(HomeState) emit,
      }) async {
    emit(HomeLoading());
    try {
      Response? response = await DioHelper.getData(
          url: ApiUrl.baseUrl,
          params: {
            'appid' : ApiUrl.apiKey,
            'lat' : (await currentPosition()).latitude.toString(), 'lon' : (await currentPosition()).longitude.toString(),
          });
      if (response!.statusCode == 200) {
        debugPrint(response.data.toString(), wrapWidth: 100);
        emit(HomeSuccess());
      }
      return response.data;
    } catch (e) {
      debugPrint(e.toString(), wrapWidth: 100);
      emit(HomeError(messageError: e.toString()));
    }
  }
}
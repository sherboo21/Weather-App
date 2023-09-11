import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gst_task/domain/model/weather.dart';
import 'package:gst_task/domain/repository/get_weather.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  GetWeatherRepository getWeatherRepository = GetWeatherRepository();
  WeatherDataModel weatherDataModel = WeatherDataModel();
  /// get weather function ///
  void getWeather() async {
    weatherDataModel = await getWeatherRepository.getWeather(emit: emit);
  }
}

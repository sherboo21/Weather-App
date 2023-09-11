import 'package:gst_task/data/repositoryImpl/get_weather.dart';
import 'package:gst_task/domain/model/weather.dart';

class GetWeatherRepository{
  GetWeatherRepositoryImpl getWeatherRepositoryImpl = GetWeatherRepositoryImpl();
  // get weather repository //

  Future<dynamic> getWeather(
      {required emit}) async {
    dynamic data = await getWeatherRepositoryImpl.getWeather(
        emit: emit);
    return data = WeatherDataModel.fromJson(data);
  }
}
import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/features/forecast_weather/data/models/forecast_weather_data.dart';

abstract class ForecastWeatherRemoteDataSource{
  Future<ForecastWeatherData> getRemoteForecastWeather(LocationEntity locationEntity);
}
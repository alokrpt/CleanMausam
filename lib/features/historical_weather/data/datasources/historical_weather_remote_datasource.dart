import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/features/historical_weather/data/models/historical_weather_data.dart';

abstract class HistoricalWeatherRemoteDataSource{
  Future<HistoricalWeatherData> getRemoteHistoricalWeather(LocationEntity locationEntity);
}
import 'package:clean_mausam/features/historical_weather/data/models/historical_weather_model.dart';
import 'package:clean_mausam/features/historical_weather/domain/entities/historical_weather.dart';
import 'package:clean_mausam/features/historical_weather/domain/entities/historical_weather_data.dart';

class HistoricalWeatherData extends HistoricalData{
  HistoricalWeatherData(List<HistoricalWeatherModel> list) : super(list);
  factory HistoricalWeatherData.fromJson(json){
  return HistoricalWeatherData(json['hourly'].map<HistoricalWeatherModel>((item) => HistoricalWeatherModel.fromJson(item)).toList());
  }
}
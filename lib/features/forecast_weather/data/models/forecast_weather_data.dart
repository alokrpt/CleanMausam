import 'package:clean_mausam/features/forecast_weather/data/models/forecast_weather_model.dart';
import 'package:clean_mausam/features/forecast_weather/domain/entities/forecast_weather.dart';
import 'package:clean_mausam/features/forecast_weather/domain/entities/weather_data.dart';
import 'package:flutter/cupertino.dart';

class ForecastWeatherData extends ForecastData{
  ForecastWeatherData(List<ForecastWeatherModel> list) : super(list);
  factory ForecastWeatherData.fromJson(json){
    // debugPrint(json['list'].toString());
    return ForecastWeatherData(
      json['list'].map<ForecastWeatherModel>((item) => ForecastWeatherModel.fromJson(item)).toList(),
    );
  }

}
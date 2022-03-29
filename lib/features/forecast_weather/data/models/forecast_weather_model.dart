import 'package:clean_mausam/core/temperature/temperature_entity.dart';
import 'package:clean_mausam/features/forecast_weather/domain/entities/forecast_weather.dart';

class ForecastWeatherModel extends ForecastWeatherEntity{
  ForecastWeatherModel({required Temperature temp, required Temperature minTemp, required Temperature maxTemp, required String description, required DateTime date, required String icon}) : super(temp: temp, minTemp: minTemp, maxTemp: maxTemp, description: description, date: date, icon: icon);
  factory ForecastWeatherModel.fromJson(json){
    return ForecastWeatherModel(temp: Temperature.celsius((json['main']['temp']as num).toDouble() ), minTemp:Temperature.celsius((json['main']['temp_min']as num).toDouble()), maxTemp: Temperature.celsius((json['main']['temp_max']as num).toDouble()), description: json['weather'][0]['description'], date: DateTime.fromMillisecondsSinceEpoch(json['dt']*1000), icon:json['weather'][0]['icon'] );
  }
}
import 'package:clean_mausam/core/temperature/temperature_entity.dart';
import 'package:clean_mausam/features/historical_weather/domain/entities/historical_weather.dart';

class HistoricalWeatherModel extends HistoricalWeatherEntity{
  HistoricalWeatherModel({required Temperature temp, required String description, required String main, required DateTime date, required String icon}) : super(temp: temp, description: description, main: main, date: date, icon: icon);

 factory HistoricalWeatherModel.fromJson(json){
    return HistoricalWeatherModel(temp: Temperature.celsius((json['temp'] as num).toDouble()), description: json['weather'][0]['description'], main: json['weather'][0]['main'], date: DateTime.fromMillisecondsSinceEpoch(json['dt']*1000), icon: json['weather'][0]['icon']);
  }

}
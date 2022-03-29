import 'package:clean_mausam/core/temperature/temperature_entity.dart';
import 'package:clean_mausam/features/current_weather/domain/entities/current_weather.dart';

class CurrentWeatherModel extends CurrentWeatherEntity{
  CurrentWeatherModel({required Temperature temp, required Temperature minTemp, required Temperature maxTemp, required String description, required DateTime date, required String icon}) : super
      (temp: temp, minTemp: minTemp, maxTemp: maxTemp, description: description, date: date, icon: icon);
  factory CurrentWeatherModel.fromJson(json){
    return CurrentWeatherModel(temp: Temperature.celsius(json['main']['temp']), minTemp:Temperature.celsius(json['main']['temp_min']), maxTemp: Temperature.celsius(json['main']['temp_max']), description: json['weather'][0]['description'], date: DateTime.fromMillisecondsSinceEpoch(json['dt']*1000), icon:json['weather'][0]['icon'] );
  }
  Map<String, dynamic> toJson(){
    return {'temp': temp.celsius , 'minTemp': minTemp.celsius, 'maxTemp': maxTemp.celsius, 'description': description, 'date':date.millisecondsSinceEpoch, 'icon': icon};
  }
}
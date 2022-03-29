import 'package:equatable/equatable.dart';

import '../../../../core/temperature/temperature_entity.dart';

class CurrentWeatherEntity extends Equatable{
  final Temperature temp;
  final Temperature minTemp;
  final Temperature maxTemp;
  final String description;
  final DateTime date;
  final String icon;
  String get iconUrl => "https://openweathermap.org/img/wn/$icon@2x.png";

  const CurrentWeatherEntity({
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.description,
    required this.date,
    required this.icon,
});

  @override
  List<Object?> get props => [temp,minTemp,maxTemp,description,date,icon];
}
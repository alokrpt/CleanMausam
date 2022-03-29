import 'package:equatable/equatable.dart';

import '../../../../core/temperature/temperature_entity.dart';

class HistoricalWeatherEntity extends Equatable{
  final Temperature temp;
  final String description;
  final String main;
  final DateTime date;
  final String icon;
  String get iconUrl => "https://openweathermap.org/img/wn/$icon@2x.png";

  const HistoricalWeatherEntity({
    required this.temp,
    required this.description,
    required this.main,
    required this.date,
    required this.icon,
  });

  @override
  List<Object?> get props => [temp,main,description,date,icon];
}
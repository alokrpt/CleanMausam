
import 'package:equatable/equatable.dart';

import 'forecast_weather.dart';

class ForecastData extends Equatable{
  const ForecastData(this.list);
  final List<ForecastWeatherEntity> list;

  @override
  List<Object?> get props => [list];
}
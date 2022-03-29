

import 'package:equatable/equatable.dart';

import 'historical_weather.dart';

class HistoricalData extends Equatable{
  const HistoricalData(this.list);
  final List<HistoricalWeatherEntity> list;

  @override
  // TODO: implement props
  List<Object?> get props => [list];
}
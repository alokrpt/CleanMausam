import 'package:clean_mausam/features/current_weather/domain/entities/current_weather.dart';

import 'current_weather_cubit.dart';
import 'package:equatable/equatable.dart';

abstract class CurrentWeatherState extends Equatable{}
class InitialState extends CurrentWeatherState{
  @override
  List<Object?> get props => [];
}
class LoadingState extends CurrentWeatherState{
  @override
  List<Object?> get props => [];
}
class LoadedState extends CurrentWeatherState{
  final CurrentWeatherEntity currentWeatherEntity;

  LoadedState(this.currentWeatherEntity);
  @override
  List<Object?> get props => [currentWeatherEntity];
}
class ErrorState extends CurrentWeatherState{
  @override
  List<Object?> get props => [];
}
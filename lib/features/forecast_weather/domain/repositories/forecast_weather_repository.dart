import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/features/current_weather/domain/entities/current_weather.dart';
import 'package:clean_mausam/features/forecast_weather/domain/entities/weather_data.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class ForecastWeatherRepository{
  Future<Either<Failure,ForecastData>> getForecastWeather(LocationEntity locationEntity);
}
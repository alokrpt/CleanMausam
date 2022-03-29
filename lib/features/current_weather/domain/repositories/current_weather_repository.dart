import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/features/current_weather/domain/entities/current_weather.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class CurrentWeatherRepository{
  Future<Either<Failure,CurrentWeatherEntity>> getCurrentWeather(LocationEntity locationEntity);
}
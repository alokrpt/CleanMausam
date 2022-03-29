
import 'package:clean_mausam/features/historical_weather/domain/entities/historical_weather_data.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/location/location_entiry.dart';

abstract class HistoricalWeatherRepository{
  Future<Either<Failure, HistoricalData>> getHistoricalWeather(LocationEntity locationEntity);
}
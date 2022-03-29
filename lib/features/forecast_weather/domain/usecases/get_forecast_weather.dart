
import 'package:clean_mausam/core/error/failures.dart';
import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/core/usecases/usecase.dart';
import 'package:clean_mausam/features/current_weather/domain/entities/current_weather.dart';
import 'package:clean_mausam/features/current_weather/domain/repositories/current_weather_repository.dart';
import 'package:clean_mausam/features/forecast_weather/domain/entities/weather_data.dart';
import 'package:clean_mausam/features/forecast_weather/domain/repositories/forecast_weather_repository.dart';
import 'package:dartz/dartz.dart';

class GetForecastWeather extends UseCase<ForecastData, LocationEntity>{
  final ForecastWeatherRepository repository;

  GetForecastWeather(this.repository);
  @override
  Future<Either<Failure, ForecastData>> call(LocationEntity params)async {
    return await repository.getForecastWeather(params);
  }

}
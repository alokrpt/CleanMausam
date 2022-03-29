
import 'package:clean_mausam/core/error/failures.dart';
import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/core/usecases/usecase.dart';
import 'package:clean_mausam/features/current_weather/domain/entities/current_weather.dart';
import 'package:clean_mausam/features/current_weather/domain/repositories/current_weather_repository.dart';
import 'package:dartz/dartz.dart';

class GetCurrentWeather extends UseCase<CurrentWeatherEntity, LocationEntity>{
  final CurrentWeatherRepository repository;

  GetCurrentWeather(this.repository);
  @override
  Future<Either<Failure, CurrentWeatherEntity>> call(LocationEntity params)async {
    return await repository.getCurrentWeather(params);
  }
  
}
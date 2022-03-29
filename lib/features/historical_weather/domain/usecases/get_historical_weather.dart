import 'package:clean_mausam/core/error/failures.dart';
import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/core/usecases/usecase.dart';
import 'package:clean_mausam/features/historical_weather/domain/entities/historical_weather_data.dart';
import 'package:clean_mausam/features/historical_weather/domain/repositories/historical_weather_repository.dart';
import 'package:dartz/dartz.dart';

class GetHistoricalWeather extends UseCase<HistoricalData, LocationEntity>{
  final HistoricalWeatherRepository repository;

  GetHistoricalWeather(this.repository);
  @override
  Future<Either<Failure, HistoricalData>> call(LocationEntity params) async {
   return await repository.getHistoricalWeather(params);
  }

}
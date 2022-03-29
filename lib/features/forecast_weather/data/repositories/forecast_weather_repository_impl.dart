import 'package:clean_mausam/core/error/failures.dart';

import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/features/forecast_weather/data/datasources/forecast_weather_remote_datasource.dart';

import 'package:clean_mausam/features/forecast_weather/domain/entities/weather_data.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/platform/network_info.dart';
import '../../../current_weather/data/datasources/current_weather_remote_datasource.dart';
import '../../domain/repositories/forecast_weather_repository.dart';

class ForecastWeatherRepositoryImpl implements ForecastWeatherRepository{
  final NetworkInfo networkInfo;
  final ForecastWeatherRemoteDataSource forecastWeatherRemoteDataSource;

  ForecastWeatherRepositoryImpl(
      {required this.networkInfo, required this.forecastWeatherRemoteDataSource});
  @override
  Future<Either<Failure, ForecastData>> getForecastWeather(LocationEntity locationEntity)async {
   if(await networkInfo.isConnected) {
      final result = await forecastWeatherRemoteDataSource
          .getRemoteForecastWeather(locationEntity);
      return Right(result);
    }
   else{
     return Left(ServerFailure());
   }
  }

}
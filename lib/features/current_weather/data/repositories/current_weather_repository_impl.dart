import 'package:clean_mausam/core/error/exception.dart';
import 'package:clean_mausam/core/error/failures.dart';
import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/core/platform/network_info.dart';
import 'package:clean_mausam/features/current_weather/data/datasources/current_weather_remote_datasource.dart';
import 'package:clean_mausam/features/current_weather/domain/entities/current_weather.dart';
import 'package:clean_mausam/features/current_weather/domain/repositories/current_weather_repository.dart';
import 'package:dartz/dartz.dart';

class CurrentWeatherRepositoryImpl implements CurrentWeatherRepository{
  final NetworkInfo networkInfo;
  final CurrentWeatherRemoteDataSource currentWeatherRemoteDataSource;

  CurrentWeatherRepositoryImpl(
      {required this.networkInfo,
      required this.currentWeatherRemoteDataSource,});
  @override
  Future<Either<Failure, CurrentWeatherEntity>> getCurrentWeather(LocationEntity locationEntity) async {
    if(await networkInfo.isConnected)
    {
      try {
        final result = await currentWeatherRemoteDataSource.getCurrentWeather(
            locationEntity);
        return Right(result);
      } on Exception catch (e) {
        return Left(ServerFailure());
      }
    }
    else{
      return Left(ServerFailure());
    }
  }
}
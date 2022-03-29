import 'package:clean_mausam/core/error/failures.dart';

import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/features/historical_weather/domain/repositories/historical_weather_repository.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/platform/network_info.dart';
import '../../../current_weather/data/datasources/current_weather_remote_datasource.dart';
import '../../domain/entities/historical_weather_data.dart';
import '../../domain/repositories/historical_weather_repository.dart';
import '../datasources/historical_weather_remote_datasource.dart';

class HistoricalWeatherRepositoryImpl implements HistoricalWeatherRepository{
  final NetworkInfo networkInfo;
  final HistoricalWeatherRemoteDataSource historicalWeatherRemoteDataSource;

  HistoricalWeatherRepositoryImpl(
      {required this.networkInfo, required this.historicalWeatherRemoteDataSource});
  @override
  Future<Either<Failure, HistoricalData>> getHistoricalWeather(LocationEntity locationEntity)async {
   if(await networkInfo.isConnected) {
      final result = await historicalWeatherRemoteDataSource
          .getRemoteHistoricalWeather(locationEntity);
      return Right(result);
    }
   else{
     return Left(ServerFailure());
   }
  }

}
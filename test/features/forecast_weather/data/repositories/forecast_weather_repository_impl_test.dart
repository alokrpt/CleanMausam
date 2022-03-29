
import 'package:clean_mausam/core/error/exception.dart';
import 'package:clean_mausam/core/error/failures.dart';
import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/core/platform/network_info.dart';
import 'package:clean_mausam/core/temperature/temperature_entity.dart';
import 'package:clean_mausam/features/current_weather/domain/entities/current_weather.dart';
import 'package:clean_mausam/features/current_weather/domain/repositories/current_weather_repository.dart';
import 'package:clean_mausam/features/forecast_weather/data/datasources/forecast_weather_remote_datasource.dart';
import 'package:clean_mausam/features/forecast_weather/data/models/forecast_weather_data.dart';
import 'package:clean_mausam/features/forecast_weather/data/models/forecast_weather_model.dart';
import 'package:clean_mausam/features/forecast_weather/data/repositories/forecast_weather_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forecast_weather_repository_impl_test.mocks.dart';


@GenerateMocks([ForecastWeatherRemoteDataSource])
@GenerateMocks([NetworkInfo])
void main(){
 // requirements
  late MockForecastWeatherRemoteDataSource mockForecastWeatherRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late ForecastWeatherRepositoryImpl currentWeatherRepositoryImpl;
  const locationEntity = LocationEntity(lat: 1.0,lon: 1.0);
  final tTemp= Temperature.celsius(0.0);
  final tForecastWeather =  ForecastWeatherModel(date: DateTime.now(),description: "test",icon: "test",maxTemp:tTemp,minTemp: tTemp,temp: tTemp );
  final tForecastData=ForecastWeatherData([tForecastWeather]);
  setUp((){
    mockForecastWeatherRemoteDataSource=MockForecastWeatherRemoteDataSource();
    mockNetworkInfo=MockNetworkInfo();
    currentWeatherRepositoryImpl=ForecastWeatherRepositoryImpl(networkInfo: mockNetworkInfo, forecastWeatherRemoteDataSource: mockForecastWeatherRemoteDataSource);
  });
  group('get remote current weather', (){
    test('should return valid Forecast Weather Entity when API is fetched successfully',() async {
    //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((realInvocation)async => true);
    when(mockForecastWeatherRemoteDataSource.getRemoteForecastWeather(locationEntity)).thenAnswer((_) async => (tForecastData));
    //act
   final result= await currentWeatherRepositoryImpl.getForecastWeather(locationEntity);
    //assert
      verify(mockNetworkInfo.isConnected);
      verify(mockForecastWeatherRemoteDataSource.getRemoteForecastWeather(any));
     expect(result, Right(tForecastData));
    });

    test('should return failure when exception happens',()async{
    //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((realInvocation)async => false);
      when(mockForecastWeatherRemoteDataSource.getRemoteForecastWeather(locationEntity)).thenAnswer((_) async => (tForecastData));
    //act
    final result=await currentWeatherRepositoryImpl.getForecastWeather(locationEntity);
    //assert
      verify(mockNetworkInfo.isConnected);
      expect(result, Left(ServerFailure()));
    verifyZeroInteractions(mockForecastWeatherRemoteDataSource);
    });
  });
}
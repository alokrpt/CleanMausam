
import 'package:clean_mausam/core/error/exception.dart';
import 'package:clean_mausam/core/error/failures.dart';
import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/core/platform/network_info.dart';
import 'package:clean_mausam/core/temperature/temperature_entity.dart';
import 'package:clean_mausam/features/current_weather/data/datasources/current_weather_remote_datasource.dart';
import 'package:clean_mausam/features/current_weather/data/models/current_weather.dart';
import 'package:clean_mausam/features/current_weather/data/repositories/current_weather_repository_impl.dart';
import 'package:clean_mausam/features/current_weather/domain/entities/current_weather.dart';
import 'package:clean_mausam/features/current_weather/domain/repositories/current_weather_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'current_weather_repository_impl.mocks.dart';

@GenerateMocks([CurrentWeatherRemoteDataSource])
@GenerateMocks([NetworkInfo])
void main(){
 // requirements
  late MockCurrentWeatherRemoteDataSource mockCurrentWeatherRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late CurrentWeatherRepositoryImpl currentWeatherRepositoryImpl;
  final LocationEntity locationEntity=LocationEntity(lat: 0.0, lon: 0.0);
  final tTemp= Temperature.celsius(0.0);
  final tCurrentWeather =  CurrentWeatherModel(date: DateTime.now(),description: "test",icon: "test",maxTemp:tTemp,minTemp: tTemp,temp: tTemp );

  setUp((){
    mockCurrentWeatherRemoteDataSource=MockCurrentWeatherRemoteDataSource();
    mockNetworkInfo=MockNetworkInfo();
    currentWeatherRepositoryImpl=CurrentWeatherRepositoryImpl(currentWeatherRemoteDataSource: mockCurrentWeatherRemoteDataSource,networkInfo: mockNetworkInfo);
  });
  group('get remote current weather', (){
    test('should return valid Current Weather Entity when API is fetched successfully',() async {
    //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((realInvocation)async => true);
    when(mockCurrentWeatherRemoteDataSource.getCurrentWeather(locationEntity)).thenAnswer((_) async => (tCurrentWeather));
    //act
   final result= await currentWeatherRepositoryImpl.getCurrentWeather(locationEntity);
    //assert
      verify(mockNetworkInfo.isConnected);
      verify(mockCurrentWeatherRemoteDataSource.getCurrentWeather(any));
     expect(result, Right(tCurrentWeather));
    });

    test('should return failure when exception happens',()async{
    //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((realInvocation)async => false);
      when(mockCurrentWeatherRemoteDataSource.getCurrentWeather(locationEntity)).thenAnswer((_) async => (tCurrentWeather));
    //act
    final result=await currentWeatherRepositoryImpl.getCurrentWeather(locationEntity);
    //assert
      verify(mockNetworkInfo.isConnected);
      expect(result, Left(ServerFailure()));
    verifyZeroInteractions(mockCurrentWeatherRemoteDataSource);
    });
  });
}
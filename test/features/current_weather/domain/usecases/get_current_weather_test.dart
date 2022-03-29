
import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/core/temperature/temperature_entity.dart';
import 'package:clean_mausam/features/current_weather/domain/entities/current_weather.dart';
import 'package:clean_mausam/features/current_weather/domain/repositories/current_weather_repository.dart';
import 'package:clean_mausam/features/current_weather/domain/usecases/get_current_weather.dart';
import 'package:clean_mausam/features/forecast_weather/domain/entities/forecast_weather.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'get_current_weather_test.mocks.dart';


@GenerateMocks([CurrentWeatherRepository])

void main(){
 late GetCurrentWeather usecase;
 late MockCurrentWeatherRepository mockCurrentWeatherRepository;

  setUp((){
    mockCurrentWeatherRepository=MockCurrentWeatherRepository();
    usecase = GetCurrentWeather(mockCurrentWeatherRepository);
  });
  const tLocation = LocationEntity(lat: 1.0,lon: 1.0);
  final tTemp= Temperature.celsius(0.0);
  final tCurrentWeather =  CurrentWeatherEntity(date: DateTime.now(),description: "test",icon: "test",maxTemp:tTemp,minTemp: tTemp,temp: tTemp );
  test('Should get current weather entity on successful response from repository',()async{
    //arrange
    when(mockCurrentWeatherRepository.getCurrentWeather(any))
        .thenAnswer((_) async => Right(tCurrentWeather));

    //act
    final result=await usecase(tLocation);
    //assert
    expect(result,Right(tCurrentWeather));
    verify(mockCurrentWeatherRepository.getCurrentWeather(tLocation));
  });
}
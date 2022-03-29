
import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/core/temperature/temperature_entity.dart';
import 'package:clean_mausam/features/current_weather/domain/entities/current_weather.dart';
import 'package:clean_mausam/features/current_weather/domain/repositories/current_weather_repository.dart';
import 'package:clean_mausam/features/current_weather/domain/usecases/get_current_weather.dart';
import 'package:clean_mausam/features/forecast_weather/domain/entities/forecast_weather.dart';
import 'package:clean_mausam/features/forecast_weather/domain/entities/weather_data.dart';
import 'package:clean_mausam/features/forecast_weather/domain/repositories/forecast_weather_repository.dart';
import 'package:clean_mausam/features/forecast_weather/domain/usecases/get_forecast_weather.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'get_forecast_weather_test.mocks.dart';


@GenerateMocks([ForecastWeatherRepository])

void main(){
  GetForecastWeather? usecase;
  MockForecastWeatherRepository? mockCurrentWeatherRepository;

  setUp((){
    mockCurrentWeatherRepository=MockForecastWeatherRepository();
    usecase = GetForecastWeather(mockCurrentWeatherRepository!);
  });
  const tLocation = LocationEntity(lat: 1.0,lon: 1.0);
  final tTemp= Temperature.celsius(0.0);
  final tForecastWeather =  ForecastWeatherEntity(date: DateTime.now(),description: "test",icon: "test",maxTemp:tTemp,minTemp: tTemp,temp: tTemp );
  final tForecastData=ForecastData([tForecastWeather]);
  test('Should get trivia for the number from repo',()async{
    when(mockCurrentWeatherRepository?.getForecastWeather(any))
        .thenAnswer((_) async => Right(tForecastData));

    //act
    final result=await usecase!(tLocation);
    //assert
    expect(result,Right(tForecastData));
    verify(mockCurrentWeatherRepository?.getForecastWeather(tLocation));
  });
}
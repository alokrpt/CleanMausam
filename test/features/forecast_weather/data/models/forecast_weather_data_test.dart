import 'dart:convert';

import 'package:clean_mausam/core/temperature/temperature_entity.dart';
import 'package:clean_mausam/features/forecast_weather/data/models/forecast_weather_data.dart';
import 'package:clean_mausam/features/forecast_weather/data/models/forecast_weather_model.dart';
import 'package:clean_mausam/features/forecast_weather/domain/entities/weather_data.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main(){
  ForecastWeatherData forecastWeatherData;
  final tTemp= Temperature.celsius(0.0);
  final tForecastWeather =  ForecastWeatherModel(date: DateTime.fromMillisecondsSinceEpoch(1646384400*1000),description: "test",icon: "test",maxTemp:tTemp,minTemp: tTemp,temp: tTemp );
  final tForecastData=ForecastWeatherData([tForecastWeather,tForecastWeather]);
  test('should be sub class of forecast weather data', (){
    //assert
    expect(tForecastData, isA<ForecastData>());
  });
  group('fromJson', (){
    test("should return list of tForecastWeather on successful json parsing", (){
      final jsonMap=json.decode(fixture("forecast_weather.json"));
      //act
      final result=ForecastWeatherData.fromJson(jsonMap);
      //assert
      expect(result, tForecastData);
    });

  });
}


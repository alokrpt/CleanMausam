import 'dart:convert';

import 'package:clean_mausam/core/temperature/temperature_entity.dart';
import 'package:clean_mausam/features/historical_weather/data/models/historical_weather_data.dart';
import 'package:clean_mausam/features/historical_weather/data/models/historical_weather_model.dart';
import 'package:clean_mausam/features/historical_weather/domain/entities/historical_weather.dart';
import 'package:clean_mausam/features/historical_weather/domain/entities/historical_weather_data.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main(){
  final tTemp=Temperature.celsius(0.0);
  final tHistoricalWeatherModel=HistoricalWeatherModel(temp: tTemp, description: 'test', main: 'test', date: DateTime.fromMillisecondsSinceEpoch(1646384400*1000), icon: 'test');
  final tHistoricalWeatherData=HistoricalWeatherData([tHistoricalWeatherModel,tHistoricalWeatherModel]);
  group("type of historical models", (){
    test('should be subclass of historical weather entity', (){
      //arrange
      //act
      //assert
      expect(tHistoricalWeatherModel,isA<HistoricalWeatherEntity>());
    });
    test('should be subclass of historical weather data entity', (){
      //arrange
      //act
      //assert
      expect(tHistoricalWeatherData,isA<HistoricalData>());
    });
  });

  test('should return historical model data on successful parsing json', (){
    //arrange
    final pJson=json.decode(fixture('historical_weather.json'));
    //act
    final result=HistoricalWeatherData.fromJson(pJson);
    //assert
    expect(result,tHistoricalWeatherData);

  });

}
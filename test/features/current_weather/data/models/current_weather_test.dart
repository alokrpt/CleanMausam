import 'dart:convert';

import 'package:clean_mausam/core/temperature/temperature_entity.dart';
import 'package:clean_mausam/features/current_weather/data/models/current_weather.dart';
import 'package:clean_mausam/features/current_weather/domain/entities/current_weather.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main(){
  final tTemp= Temperature.celsius(0.0);
  CurrentWeatherModel tCurrentWeatherModel=CurrentWeatherModel(temp: tTemp , minTemp: tTemp, maxTemp: tTemp, description: 'test', date: DateTime.fromMillisecondsSinceEpoch(1560350645), icon: 'test');
  
  test('should be sub class of Current Weather Entity ', (){
    //assert
    expect(tCurrentWeatherModel, isA<CurrentWeatherEntity>());
  });

  group('fromJson', (){
    test("should return current weather model on parsing json", ()async{
      //arrange
      final jsonMap=json.decode(fixture('current_weather.json'));
      //act
    final result=CurrentWeatherModel.fromJson(jsonMap);
    //assert
     expect(result, tCurrentWeatherModel);
    });

  });

  group('toJson', (){
    test('should return a valid json from Current Weather Model', (){
      //arrange
      final expectedJson={'temp': 0.0 , 'minTemp': 0.0, 'maxTemp': 0.0, 'description': 'test', 'date':1560350645, 'icon': 'test'};
      //act
      final result=tCurrentWeatherModel.toJson();
      //assert
      expect(result, expectedJson);
    });
  });
}
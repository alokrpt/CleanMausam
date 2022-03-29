import 'dart:convert';

import 'package:clean_mausam/core/api/api_keys.dart';
import 'package:clean_mausam/core/api/weather_api.dart';
import 'package:clean_mausam/core/error/exception.dart';
import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/core/temperature/temperature_entity.dart';
import 'package:clean_mausam/features/current_weather/data/datasources/current_weather_remote_datasource.dart';
import 'package:clean_mausam/features/current_weather/data/models/current_weather.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'current_weather_remote_datasource_test.mocks.dart';


@GenerateMocks([http.Client])
void main(){
  late CurrentWeatherRemoteDataSourceImpl dataSourceImpl;
  late MockClient mockHttpClient;
  late OpenWeatherMapAPI api;
  setUp(() {
    mockHttpClient = MockClient();
    api=OpenWeatherMapAPI(APIKeys.weatherKey);
    dataSourceImpl = CurrentWeatherRemoteDataSourceImpl(client: mockHttpClient, api: api);
  });
  const LocationEntity locationEntity=LocationEntity(lat: 0.0, lon: 0.0);


  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(  api.weather(locationEntity))).thenAnswer(
          (_) async => http.Response(fixture('current_weather.json'), 200),
    );
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(api.weather(locationEntity))).thenAnswer(
          (_) async => http.Response('Something went wrong', 404),
    );
  }
  final tTemp= Temperature.celsius(0.0);
  final tCurrentWeather =  CurrentWeatherModel(date: DateTime.fromMillisecondsSinceEpoch(1560350645*1000),description: "test",icon: "test",maxTemp:tTemp,minTemp: tTemp,temp: tTemp );

  group('getCurrentWeather', () {

    test(
      'should preform a GET request on a URL with number location endpoint and with application/json header',
          () async{
        //arrange
        setUpMockHttpClientSuccess200();
        // act
      await  dataSourceImpl.getCurrentWeather(locationEntity);
        // assert
        verify(mockHttpClient.get(
          api.weather(locationEntity),
        ));
      },
    );
  });


  test(
    'should return NumberTrivia when the response code is 200 (success)',
        () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      final result = await dataSourceImpl.getCurrentWeather(locationEntity);
      // assert
      expect(result, equals(tCurrentWeather));
    },
  );
  test(
    'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      setUpMockHttpClientFailure404();
      // act
      final call = dataSourceImpl.getCurrentWeather(locationEntity);
      // assert
      expect(() => call, throwsA(TypeMatcher<ServerException>()));
    },
  );

  group('getRandomNumberTrivia', () {
    final currentWeatherNumbers =
    CurrentWeatherModel.fromJson(json.decode(fixture('current_weather.json')));

    test(
      'should preform a GET request on a URL with *random* endpoint with application/json header',
          () {
        //arrange
        setUpMockHttpClientSuccess200();
        // act
        dataSourceImpl.getCurrentWeather(locationEntity);
        // assert
        verify(mockHttpClient.get(
          api.weather(locationEntity)
        ));
      },
    );

    test(
      'should return NumberTrivia when the response code is 200 (success)',
          () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSourceImpl.getCurrentWeather(locationEntity);
        // assert
        expect(result, equals(tCurrentWeather));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
          () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSourceImpl.getCurrentWeather(locationEntity);
        // assert
        expect(() => call, throwsA(TypeMatcher<ServerException>()));
      },
    );
  });

}
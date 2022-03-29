import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/core/temperature/temperature_entity.dart';
import 'package:clean_mausam/features/historical_weather/domain/entities/historical_weather.dart';
import 'package:clean_mausam/features/historical_weather/domain/entities/historical_weather_data.dart';
import 'package:clean_mausam/features/historical_weather/domain/repositories/historical_weather_repository.dart';
import 'package:clean_mausam/features/historical_weather/domain/usecases/get_historical_weather.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_historical_weather_test.mocks.dart';

@GenerateMocks([HistoricalWeatherRepository])
void main(){
 late GetHistoricalWeather usecase;
 late MockHistoricalWeatherRepository mockHistoricalRepository;
  setUp((){
    mockHistoricalRepository=MockHistoricalWeatherRepository();
    usecase=GetHistoricalWeather(mockHistoricalRepository);
  });
  final historicalWeatherEntity=HistoricalWeatherEntity(temp: Temperature.celsius(0.0), description: "test", main: "test", date: DateTime.now(), icon: "icon");
  HistoricalData historicalData=HistoricalData([historicalWeatherEntity]);
  const locationEntity=LocationEntity(lat: 0.0, lon: 0.0);

  test("should get historical data on successful response from mockHistoricalRepository ", ()async {
    //arrange
    when(mockHistoricalRepository.getHistoricalWeather(any)).thenAnswer((_) async=>  Right(historicalData));

    //act
    final result=await usecase(locationEntity);
    //assert
    expect(result,Right(historicalData));
    verify(mockHistoricalRepository.getHistoricalWeather(locationEntity));
  },);
}
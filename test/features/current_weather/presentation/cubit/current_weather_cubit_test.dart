
import 'package:clean_mausam/core/error/failures.dart';
import 'package:clean_mausam/core/location/data/location_sensor_service.dart';
import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/core/temperature/temperature_entity.dart';
import 'package:clean_mausam/features/current_weather/data/models/current_weather.dart';
import 'package:clean_mausam/features/current_weather/domain/repositories/current_weather_repository.dart';
import 'package:clean_mausam/features/current_weather/presentation/cubit/current_weather_cubit.dart';
import 'package:clean_mausam/features/current_weather/presentation/cubit/current_weather_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../domain/usecases/get_current_weather_test.mocks.dart';

@GenerateMocks([CurrentWeatherRepository])

void main()  {
late MockCurrentWeatherRepository mockCurrentWeatherRepository=MockCurrentWeatherRepository();
late CurrentWeatherCubit cubit;
setUp((){
  mockCurrentWeatherRepository=MockCurrentWeatherRepository();
  cubit=CurrentWeatherCubit(locationService: LocationService(), repository: mockCurrentWeatherRepository);
});

LocationEntity locationEntity=const LocationEntity(lat: 1.0, lon: 1.0);
final tTemp= Temperature.celsius(0.0);
final tCurrentWeather =  CurrentWeatherModel(date: DateTime.now(),description: "test",icon: "test",maxTemp:tTemp,minTemp: tTemp,temp: tTemp );

test('should emit state of error', ()async{
  //arrange
  when(mockCurrentWeatherRepository.getCurrentWeather(locationEntity)).thenAnswer((_) async=> Left(ServerFailure()));
  //act
  //assert
  final expected=[InitialState(),LoadingState(),ErrorState()];
await  expectLater(cubit.state, ErrorState());
});
test('should emit state of value', ()async{
  //arrange
  when(mockCurrentWeatherRepository.getCurrentWeather(any)).thenAnswer((_) async=> Right(tCurrentWeather));
  //act
  cubit.getCurrentWeatherCubit();
  // debugPrint((mockCurrentWeatherRepository.getCurrentWeather(locationEntity)).toString());
  //assert
   final expected=[InitialState(),LoadingState(),LoadedState(tCurrentWeather)];
await  expectLater(cubit.state, LoadedState(tCurrentWeather));
});

}
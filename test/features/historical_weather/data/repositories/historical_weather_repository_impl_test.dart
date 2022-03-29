
import 'package:clean_mausam/core/error/failures.dart';
import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/core/platform/network_info.dart';
import 'package:clean_mausam/core/temperature/temperature_entity.dart';
import 'package:clean_mausam/features/historical_weather/data/datasources/historical_weather_remote_datasource.dart';
import 'package:clean_mausam/features/historical_weather/data/models/historical_weather_data.dart';
import 'package:clean_mausam/features/historical_weather/data/models/historical_weather_model.dart';
import 'package:clean_mausam/features/historical_weather/data/repositories/historical_weather_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'historical_weather_repository_impl_test.mocks.dart';


@GenerateMocks([HistoricalWeatherRemoteDataSource])
@GenerateMocks([NetworkInfo])
void main(){
 // requirements
  late MockHistoricalWeatherRemoteDataSource mockHistoricalWeatherRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late HistoricalWeatherRepositoryImpl currentWeatherRepositoryImpl;
  const locationEntity = LocationEntity(lat: 1.0,lon: 1.0);
  final tTemp= Temperature.celsius(0.0);
  final historicalWeatherEntity=HistoricalWeatherModel(temp: Temperature.celsius(0.0), description: "test", main: "test", date: DateTime.now(), icon: "icon");
  HistoricalWeatherData historicalData=HistoricalWeatherData([historicalWeatherEntity]);
  setUp((){
    mockHistoricalWeatherRemoteDataSource=MockHistoricalWeatherRemoteDataSource();
    mockNetworkInfo=MockNetworkInfo();
    currentWeatherRepositoryImpl=HistoricalWeatherRepositoryImpl(networkInfo: mockNetworkInfo,  historicalWeatherRemoteDataSource: mockHistoricalWeatherRemoteDataSource);
  });
  group('get remote current weather', (){
    test('should return valid Historical Weather Entity when API is fetched successfully',() async {
    //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((realInvocation)async => true);
    when(mockHistoricalWeatherRemoteDataSource.getRemoteHistoricalWeather(locationEntity)).thenAnswer((_) async => (historicalData));
    //act
   final result= await currentWeatherRepositoryImpl.getHistoricalWeather(locationEntity);
    //assert
      verify(mockNetworkInfo.isConnected);
      verify(mockHistoricalWeatherRemoteDataSource.getRemoteHistoricalWeather(any));
     expect(result, Right(historicalData));
    });

    test('should return failure when exception happens',()async{
    //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((realInvocation)async => false);
      when(mockHistoricalWeatherRemoteDataSource.getRemoteHistoricalWeather(locationEntity)).thenAnswer((_) async => (historicalData));
    //act
    final result=await currentWeatherRepositoryImpl.getHistoricalWeather(locationEntity);
    //assert
      verify(mockNetworkInfo.isConnected);
      expect(result, Left(ServerFailure()));
    verifyZeroInteractions(mockHistoricalWeatherRemoteDataSource);
    });
  });
}
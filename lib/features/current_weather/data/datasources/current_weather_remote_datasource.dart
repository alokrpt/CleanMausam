 import 'dart:convert';

import 'package:clean_mausam/core/location/data/location_model.dart';
import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/features/current_weather/data/models/current_weather.dart';
 import 'package:http/http.dart' as http;

import '../../../../core/api/weather_api.dart';
import '../../../../core/error/exception.dart';

 abstract class CurrentWeatherRemoteDataSource{
  Future<CurrentWeatherModel> getCurrentWeather(LocationEntity locationEntity);
}


 class CurrentWeatherRemoteDataSourceImpl implements CurrentWeatherRemoteDataSource {
  final http.Client client;
  final OpenWeatherMapAPI api;


  CurrentWeatherRemoteDataSourceImpl( {required this.client,required this.api});

  Future<CurrentWeatherModel> _getData(Uri url) async {
   final response = await client.get(
    url,
   );

   if (response.statusCode == 200) {
    return CurrentWeatherModel.fromJson(json.decode(response.body));
   } else {
    throw ServerException();
   }
  }

  @override
  Future<CurrentWeatherModel> getCurrentWeather(LocationEntity locationEntity) async{
    return _getData(api.weather(locationEntity));
  }
 }
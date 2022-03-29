import 'package:clean_mausam/core/location/data/location_sensor_service.dart';
import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:clean_mausam/features/current_weather/domain/repositories/current_weather_repository.dart';
import 'package:clean_mausam/features/current_weather/presentation/cubit/current_weather_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState>{
  CurrentWeatherCubit( {required this.locationService,required this.repository}) : super(InitialState()){
   // getCurrentWeatherCubit();
  }
  final CurrentWeatherRepository repository;
  final LocationService locationService;
  void getCurrentWeatherCubit() async{
    try {
      emit(LoadingState());
      LocationEntity locationEntity=await locationService.fetchLocation();
      final either = await repository.getCurrentWeather(locationEntity);

        either.fold((l) => emit(ErrorState()), (r) => emit(LoadedState(r)));

    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorState());
    }
  }
}

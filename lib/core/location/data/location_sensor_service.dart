import 'package:clean_mausam/core/location/data/location_model.dart';
import 'package:clean_mausam/core/location/location_entiry.dart';
import 'package:location/location.dart';
import 'package:location_platform_interface/location_platform_interface.dart';

class LocationService{
  Future<LocationEntity> fetchLocation() async {
    //todo
   LocationData locationData=await LocationData.fromMap({
     'latitude':1.0,
     'longitude':1.0,
   });

    return LocationModel.fromLocationData(locationData);
  }
}
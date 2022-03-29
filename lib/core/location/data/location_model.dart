import 'package:location/location.dart';

import 'package:clean_mausam/core/location/location_entiry.dart';

class LocationModel extends LocationEntity{
  LocationModel({required double lat, required double lon}) : super(lat: lat, lon: lon);
  factory LocationModel.fromLocationData(LocationData locationData){
    return LocationModel(lat: locationData.latitude??0.0, lon: locationData.longitude??0.0);
  }
}
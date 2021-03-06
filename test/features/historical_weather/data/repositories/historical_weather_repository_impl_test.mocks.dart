// Mocks generated by Mockito 5.1.0 from annotations
// in clean_mausam/test/features/historical_weather/data/repositories/historical_weather_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:clean_mausam/core/location/location_entiry.dart' as _i5;
import 'package:clean_mausam/core/platform/network_info.dart' as _i6;
import 'package:clean_mausam/features/historical_weather/data/datasources/historical_weather_remote_datasource.dart'
    as _i3;
import 'package:clean_mausam/features/historical_weather/data/models/historical_weather_data.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeHistoricalWeatherData_0 extends _i1.Fake
    implements _i2.HistoricalWeatherData {}

/// A class which mocks [HistoricalWeatherRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockHistoricalWeatherRemoteDataSource extends _i1.Mock
    implements _i3.HistoricalWeatherRemoteDataSource {
  MockHistoricalWeatherRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.HistoricalWeatherData> getRemoteHistoricalWeather(
          _i5.LocationEntity? locationEntity) =>
      (super.noSuchMethod(
              Invocation.method(#getRemoteHistoricalWeather, [locationEntity]),
              returnValue: Future<_i2.HistoricalWeatherData>.value(
                  _FakeHistoricalWeatherData_0()))
          as _i4.Future<_i2.HistoricalWeatherData>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i6.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}

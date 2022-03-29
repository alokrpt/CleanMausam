
import 'package:clean_mausam/core/platform/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main(){
  late NetworkInfoImpl networkInfoImpl;
  late MockInternetConnectionChecker mockDataConnectionChecker;

  setUp((){
    mockDataConnectionChecker=MockInternetConnectionChecker();
    networkInfoImpl=NetworkInfoImpl(dataConnectionChecker: mockDataConnectionChecker);
  });

  group('isConnected', (){
    test('should call internet_connection_checker when network_info called',() async {
      //arrange
      when(mockDataConnectionChecker.hasConnection).thenAnswer((realInvocation)async => true);
      //act
      final result=await networkInfoImpl.isConnected;
      //assert
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, true);
    });
  });
}

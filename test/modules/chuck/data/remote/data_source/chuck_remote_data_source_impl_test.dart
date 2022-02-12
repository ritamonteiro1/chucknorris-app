import 'package:chuck_norris_app/modules/chuck/data/remote/data_source/chuck_remote_data_source_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'chuck_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late ChuckRemoteDataSourceImpl chuckRemoteDataSourceImpl;
  setUpAll(() {
    mockDio = MockDio();
    chuckRemoteDataSourceImpl = ChuckRemoteDataSourceImpl(dio: mockDio);
  });
  setUp(() {
    reset(mockDio);
  });
}

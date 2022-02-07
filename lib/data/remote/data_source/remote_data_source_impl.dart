import 'package:dio/dio.dart';

import 'remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl(
    this.dio,
  );

  final Dio dio;
  static const _baseUrl = 'https://api.chucknorris.io/';
}

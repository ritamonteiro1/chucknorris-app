import 'package:dio/dio.dart';

import '../../../domain/exception/generic_error_status_code_exception.dart';
import '../../../domain/model/category/chuck_category_model.dart';
import '../../../domain/model/joke/chuck_joke_model.dart';
import '../../mapper/remote_to_model.dart';
import '../model/category/chuck_category_response.dart';
import '../model/joke/chuck_joke_response.dart';
import 'chuck_remote_data_source.dart';

class ChuckRemoteDataSourceImpl implements ChuckRemoteDataSource {
  ChuckRemoteDataSourceImpl({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;
  static const _baseUrl = 'https://api.chucknorris.io/';

  @override
  Future<List<ChuckCategoryModel>> getChuckCategoryList() async {
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    try {
      final response = await _dio.get('${_baseUrl}jokes/categories');
      final chuckCategoryList =
          ChuckCategoryResponse.fromJsonList(response.data);
      return chuckCategoryList.toChuckCategoryModel();
    } on DioError catch (dioError, _) {
      if (dioError.type == DioErrorType.response) {
        throw GenericErrorStatusCodeException();
      } else {
        throw Exception();
      }
    }
  }

  @override
  Future<ChuckJokeModel> getChuckJoke({required String chuckCategory}) async {
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    try {
      final response =
          await _dio.get('${_baseUrl}jokes/random?category=$chuckCategory');
      final chuckJoke =
          ChuckJokeResponse.fromJson(response.data).toChuckJokeModel();
      return chuckJoke;
    } on DioError catch (dioError, _) {
      if (dioError.type == DioErrorType.response) {
        throw GenericErrorStatusCodeException();
      } else {
        throw Exception();
      }
    }
  }

  @override
  Future<ChuckJokeModel> getChuckRandomJoke() async {
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    try {
      final response = await _dio.get('${_baseUrl}jokes/random');
      final chuckJoke =
          ChuckJokeResponse.fromJson(response.data).toChuckJokeModel();
      return chuckJoke;
    } on DioError catch (dioError, _) {
      if (dioError.type == DioErrorType.response) {
        throw GenericErrorStatusCodeException();
      } else {
        throw Exception();
      }
    }
  }
}

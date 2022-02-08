import 'package:chuck_norris_app/data/remote/model/category/chuck_category_list_response.dart';
import 'package:dio/dio.dart';

import '../../../domain/exception/generic_error_status_code_exception.dart';
import '../../../domain/model/category/chuck_category_model.dart';
import '../../mapper/remote_do_model.dart';
import 'chuck_remote_data_source.dart';

class ChuckRemoteDataSourceImpl implements ChuckRemoteDataSource {
  ChuckRemoteDataSourceImpl(
    this._dio,
  );

  final Dio _dio;
  static const _baseUrl = 'https://api.chucknorris.io/';

  @override
  Future<List<ChuckCategoryModel>> getChuckCategoryList() async {
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    try {
      final response = await _dio.get('${_baseUrl}jokes/categories');
      final chuckCategoryList =
          ChuckCategoryListResponse.fromJson(response.data)
              .toChuckCategoryModel();
      return chuckCategoryList;
    } on DioError catch (dioError, _) {
      if (dioError.type == DioErrorType.response) {
        throw GenericErrorStatusCodeException();
      } else {
        throw Exception();
      }
    }
  }
}

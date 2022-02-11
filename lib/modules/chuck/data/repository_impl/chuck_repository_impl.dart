import '../../domain/model/category/chuck_category_model.dart';
import '../../domain/model/joke/chuck_joke_model.dart';
import '../../domain/repository/chuck_repository.dart';
import '../cache/data_source/chuck_cache_data_source.dart';
import '../remote/data_source/chuck_remote_data_source.dart';

class ChuckRepositoryImpl implements ChuckRepository {
  ChuckRepositoryImpl({
    required ChuckRemoteDataSource chuckRemoteDataSource,
    required ChuckCacheDataSource chuckCacheDataSource,
  })  : _chuckRemoteDataSource = chuckRemoteDataSource,
        _chuckCacheDataSource = chuckCacheDataSource;

  final ChuckRemoteDataSource _chuckRemoteDataSource;
  final ChuckCacheDataSource _chuckCacheDataSource;

  @override
  Future<List<ChuckCategoryModel>> getChuckCategoryList() async {
    try {
      final chuckCategoryList =
          await _chuckRemoteDataSource.getChuckCategoryList();
      await _chuckCacheDataSource.saveChuckCategoryList(chuckCategoryList);
      return _chuckCacheDataSource.getChuckCategoryList();
    } on Exception {
      return _chuckCacheDataSource.getChuckCategoryList();
    }
  }

  @override
  Future<ChuckJokeModel> getChuckJoke({required String chuckCategory}) async =>
      _chuckRemoteDataSource.getChuckJoke(chuckCategory: chuckCategory);

  @override
  Future<ChuckJokeModel> getChuckRandomJoke() async =>
      _chuckRemoteDataSource.getChuckRandomJoke();
}

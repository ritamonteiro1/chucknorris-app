import '../../../domain/model/category/chuck_category_model.dart';
import '../../../domain/model/joke/chuck_joke_model.dart';
import '../../../domain/repository/chuck_repository.dart';
import '../data_source/chuck_remote_data_source.dart';

class ChuckRepositoryImpl implements ChuckRepository {
  ChuckRepositoryImpl({
    required ChuckRemoteDataSource chuckRemoteDataSource,
  }) : _chuckRemoteDataSource = chuckRemoteDataSource;

  final ChuckRemoteDataSource _chuckRemoteDataSource;

  @override
  Future<List<ChuckCategoryModel>> getChuckCategoryList() =>
      _chuckRemoteDataSource.getChuckCategoryList();

  @override
  Future<ChuckJokeModel> getChuckJoke({required String chuckCategory}) =>
      _chuckRemoteDataSource.getChuckJoke(chuckCategory: chuckCategory);

  @override
  Future<ChuckJokeModel> getChuckRandomJoke() =>
      _chuckRemoteDataSource.getChuckRandomJoke();
}

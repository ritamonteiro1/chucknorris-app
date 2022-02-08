import 'package:chuck_norris_app/domain/model/joke/chuck_joke_model.dart';

import '../../data/remote/data_source/chuck_remote_data_source.dart';
import '../model/category/chuck_category_model.dart';

import 'chuck_repository.dart';

class ChuckRepositoryImpl implements ChuckRepository {
  ChuckRepositoryImpl(
    this.chuckRemoteDataSource,
  );

  final ChuckRemoteDataSource chuckRemoteDataSource;

  @override
  Future<List<ChuckCategoryModel>> getChuckCategoryList() =>
      chuckRemoteDataSource.getChuckCategoryList();

  @override
  Future<ChuckJokeModel> getChuckJoke({required String chuckCategory}) =>
      chuckRemoteDataSource.getChuckJoke(chuckCategory: chuckCategory);

  @override
  Future<ChuckJokeModel> getChuckRandomJoke() =>
      chuckRemoteDataSource.getChuckRandomJoke();
}

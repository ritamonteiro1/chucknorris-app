import '../../../domain/model/joke/chuck_joke_model.dart';

import '../../../domain/model/category/chuck_category_model.dart';

abstract class ChuckRemoteDataSource {
  Future<List<ChuckCategoryModel>> getChuckCategoryList();

  Future<ChuckJokeModel> getChuckJoke({required String chuckCategory});
}

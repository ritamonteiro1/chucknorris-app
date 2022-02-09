import '../model/joke/chuck_joke_model.dart';

import '../model/category/chuck_category_model.dart';

abstract class ChuckRepository {
  Future<List<ChuckCategoryModel>> getChuckCategoryList();

  Future<ChuckJokeModel> getChuckJoke({required String chuckCategory});

  Future<ChuckJokeModel> getChuckRandomJoke();
}

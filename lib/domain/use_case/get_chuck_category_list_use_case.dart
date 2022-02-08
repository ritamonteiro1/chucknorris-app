import '../model/joke/chuck_joke_model.dart';

import '../model/category/chuck_category_model.dart';

abstract class GetChuckCategoryListUseCase {
  Future<List<ChuckCategoryModel>> getChuckCategoryList();
  Future<ChuckJokeModel> getChuckJoke({required String chuckCategory});
}

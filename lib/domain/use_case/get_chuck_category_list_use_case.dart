import '../model/category/chuck_category_model.dart';
import '../model/joke/chuck_joke_model.dart';

abstract class GetChuckCategoryListUseCase {
  Future<List<ChuckCategoryModel>> getChuckCategoryList();

  Future<ChuckJokeModel> getChuckJoke({required String chuckCategory});

  Future<ChuckJokeModel> getChuckRandomJoke();
}

import '../model/joke/chuck_joke_model.dart';

mixin GetChuckCategoryJokeUseCase {
  Future<ChuckJokeModel> call({required String chuckCategory});
}

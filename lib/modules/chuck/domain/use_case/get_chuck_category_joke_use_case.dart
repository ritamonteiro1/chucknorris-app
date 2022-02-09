import '../model/joke/chuck_joke_model.dart';

mixin GetChuckCategoryJokeUseCase{
  Future<ChuckJokeModel> getChuckJoke({required String chuckCategory});
}
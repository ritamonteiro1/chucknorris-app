import '../model/joke/chuck_joke_model.dart';

mixin GetChuckRandomJokeUseCase {
  Future<ChuckJokeModel> call();
}

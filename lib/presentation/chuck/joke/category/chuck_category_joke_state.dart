import '../../../../domain/model/joke/chuck_joke_model.dart';

abstract class ChuckCategoryJokeState {}

class LoadingChuckCategoryJokeState implements ChuckCategoryJokeState {}

class SuccessChuckCategoryJokeState implements ChuckCategoryJokeState {
  SuccessChuckCategoryJokeState(
    this.joke,
  );

  final ChuckJokeModel joke;
}

class ErrorChuckCategoryJokeState implements ChuckCategoryJokeState {
  ErrorChuckCategoryJokeState(
    this.exception,
  );

  final Exception exception;
}

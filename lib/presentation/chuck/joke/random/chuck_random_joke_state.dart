import '../../../../domain/model/joke/chuck_joke_model.dart';

abstract class ChuckRandomJokeState {}

class LoadingChuckRandomJokeState implements ChuckRandomJokeState {}

class SuccessChuckRandomJokeState implements ChuckRandomJokeState {
  SuccessChuckRandomJokeState(
    this.chuckJokeModel,
  );

  final ChuckJokeModel chuckJokeModel;
}

class ErrorChuckRandomJokeState implements ChuckRandomJokeState {
  ErrorChuckRandomJokeState(
    this.exception,
  );

  final Exception exception;
}

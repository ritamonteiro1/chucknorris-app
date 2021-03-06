import 'package:mobx/mobx.dart';

import '../../../../domain/use_case/get_chuck_random_joke_use_case.dart';
import 'chuck_random_joke_state.dart';

part 'chuck_random_joke_store.g.dart';

class ChuckRandomJokeStore = _ChuckRandomJokeStore with _$ChuckRandomJokeStore;

abstract class _ChuckRandomJokeStore with Store {
  _ChuckRandomJokeStore({
    required GetChuckRandomJokeUseCase getChuckRandomJokeUseCase,
  }) : _getChuckRandomJokeUseCase = getChuckRandomJokeUseCase;

  final GetChuckRandomJokeUseCase _getChuckRandomJokeUseCase;

  @observable
  ChuckRandomJokeState chuckRandomJokeState = LoadingChuckRandomJokeState();

  @action
  Future<void> getChuckRandomJoke() async {
    chuckRandomJokeState = LoadingChuckRandomJokeState();
    try {
      final joke = await _getChuckRandomJokeUseCase.call();
      chuckRandomJokeState = SuccessChuckRandomJokeState(joke);
    } on Exception catch (e) {
      chuckRandomJokeState = ErrorChuckRandomJokeState(e);
    }
  }
}

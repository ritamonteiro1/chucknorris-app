import 'package:mobx/mobx.dart';

import '../../../../domain/use_case/get_chuck_category_joke_use_case.dart';
import 'chuck_category_joke_state.dart';

part 'chuck_category_joke_store.g.dart';

class ChuckCategoryJokeStore = _ChuckCategoryJokeStore
    with _$ChuckCategoryJokeStore;

abstract class _ChuckCategoryJokeStore with Store {
  _ChuckCategoryJokeStore({
    required GetChuckCategoryJokeUseCase getChuckCategoryJokeUseCase,
  }) : _getChuckCategoryJokeUseCase = getChuckCategoryJokeUseCase;

  final GetChuckCategoryJokeUseCase _getChuckCategoryJokeUseCase;

  @observable
  ChuckCategoryJokeState chuckCategoryJokeState =
      LoadingChuckCategoryJokeState();

  @action
  Future<void> getChuckCategoryJoke({required String category}) async {
    chuckCategoryJokeState = LoadingChuckCategoryJokeState();
    try {
      final joke =
          await _getChuckCategoryJokeUseCase.call(chuckCategory: category);
      chuckCategoryJokeState = SuccessChuckCategoryJokeState(joke);
    } on Exception catch (e) {
      chuckCategoryJokeState = ErrorChuckCategoryJokeState(e);
    }
  }
}

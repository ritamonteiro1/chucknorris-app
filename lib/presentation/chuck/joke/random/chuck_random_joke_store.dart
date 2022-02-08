import 'package:chuck_norris_app/domain/use_case/get_chuck_random_joke_use_case.dart';
import 'package:mobx/mobx.dart';

part 'chuck_random_joke_store.g.dart';

class ChuckRandomJokeStore = _ChuckRandomJokeStore with _$ChuckRandomJokeStore;

abstract class _ChuckRandomJokeStore with Store {
  _ChuckRandomJokeStore(
    this.getChuckRandomJokeUseCase,
  );

  final GetChuckRandomJokeUseCase getChuckRandomJokeUseCase;
}

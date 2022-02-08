import '../../../domain/use_case/get_chuck_category_joke_use_case.dart';
import 'package:mobx/mobx.dart';

part 'chuck_category_joke_store.g.dart';

class ChuckCategoryJokeStore = _ChuckCategoryJokeStore
    with _$ChuckCategoryJokeStore;

abstract class _ChuckCategoryJokeStore with Store {
  _ChuckCategoryJokeStore(
    this.getChuckCategoryJokeUseCase,
  );

  final GetChuckCategoryJokeUseCase getChuckCategoryJokeUseCase;

  @observable
  String name = '';
}

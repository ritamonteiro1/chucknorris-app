import 'package:mobx/mobx.dart';

import '../../../domain/use_case/get_chuck_category_list_use_case.dart';
import 'chuck_category_state.dart';

part 'chuck_category_store.g.dart';

class ChuckCategoryStore = _ChuckCategoryStore with _$ChuckCategoryStore;

abstract class _ChuckCategoryStore with Store {
  _ChuckCategoryStore({
    required GetChuckCategoryListUseCase getChuckCategoryListUseCase,
  }) : _getChuckCategoryListUseCase = getChuckCategoryListUseCase;

  final GetChuckCategoryListUseCase _getChuckCategoryListUseCase;

  @observable
  ChuckCategoryState chuckCategoryState = LoadingChuckCategoryState();

  @action
  Future<void> getChuckCategoryList() async {
    chuckCategoryState = LoadingChuckCategoryState();
    try {
      final chuckCategoryList = await _getChuckCategoryListUseCase.call();
      chuckCategoryState = SuccessChuckCategoryState(chuckCategoryList);
    } on Exception catch (e) {
      chuckCategoryState = ErrorChuckCategoryState(e);
    }
  }
}

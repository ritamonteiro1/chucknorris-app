import 'package:mobx/mobx.dart';

import '../../../domain/exception/generic_error_status_code_exception.dart';
import '../../../domain/model/category/chuck_category_model.dart';
import '../../../domain/use_case/get_chuck_category_list_use_case.dart';
import 'chuck_category_state.dart';

part 'chuck_category_store.g.dart';

class ChuckCategoryStore = _ChuckCategoryStore with _$ChuckCategoryStore;

abstract class _ChuckCategoryStore with Store {
  _ChuckCategoryStore(
    this.getChuckCategoryListUseCase,
  );

  final GetChuckCategoryListUseCase getChuckCategoryListUseCase;

  @observable
  ObservableList<ChuckCategoryModel> categoryList =
      ObservableList<ChuckCategoryModel>.of([]);

  @observable
  ChuckCategoryState chuckCategoryState = ChuckCategoryState.loading;

  @action
  Future<void> getChuckCategoryList() async {
    try {
      final chuckCategoryList =
          await getChuckCategoryListUseCase.getChuckCategoryList();
      chuckCategoryState = ChuckCategoryState.success;
      categoryList = chuckCategoryList.asObservable();
    } on GenericErrorStatusCodeException {
      chuckCategoryState = ChuckCategoryState.genericError;
    } on Exception {
      chuckCategoryState = ChuckCategoryState.networkError;
    }
  }
}

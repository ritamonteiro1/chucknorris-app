import '../../../domain/model/category/chuck_category_model.dart';

abstract class ChuckCategoryState {}

class LoadingChuckCategoryState implements ChuckCategoryState {}

class SuccessChuckCategoryState implements ChuckCategoryState {
  SuccessChuckCategoryState(
    this.categoryList,
  );

  final List<ChuckCategoryModel> categoryList;
}

class ErrorChuckCategoryState implements ChuckCategoryState {
  ErrorChuckCategoryState(
    this.exception,
  );

  final Exception exception;
}

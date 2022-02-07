import '../model/category/chuck_category_model.dart';

mixin GetChuckCategoryListUseCase {
  Future<List<ChuckCategoryModel>> getChuckCategoryList(
      {required String category});
}

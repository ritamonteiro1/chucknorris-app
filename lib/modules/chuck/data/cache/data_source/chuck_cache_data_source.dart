import '../../../domain/model/category/chuck_category_model.dart';

mixin ChuckCacheDataSource {
  Future<List<ChuckCategoryModel>> getChuckCategoryList();

  Future<void> saveChuckCategoryList(
      List<ChuckCategoryModel> chuckCategoryList);
}

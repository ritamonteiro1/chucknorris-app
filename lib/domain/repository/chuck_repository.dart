import '../model/category/chuck_category_model.dart';

mixin ChuckRepository {
  Future<List<ChuckCategoryModel>> getChuckCategoryList();
}

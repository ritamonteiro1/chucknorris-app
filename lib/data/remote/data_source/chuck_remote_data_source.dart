import '../../../domain/model/category/chuck_category_model.dart';

mixin ChuckRemoteDataSource {
  Future<List<ChuckCategoryModel>> getChuckCategoryList(
      {required String category});
}

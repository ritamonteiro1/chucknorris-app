import '../remote/model/category/chuck_category_list_response.dart';

import '../../domain/model/category/chuck_category_model.dart';

extension ChuckCategoryListResponseToChuckCategoryModel
    on ChuckCategoryListResponse {
  List<ChuckCategoryModel> toChuckCategoryModel() => chuckCategoryList
      .map(
        (item) => ChuckCategoryModel(item.title ?? ' - '),
      )
      .toList();
}

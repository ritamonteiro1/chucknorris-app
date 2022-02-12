import '../../domain/model/category/chuck_category_model.dart';
import '../cache/model/chuck_category_cm.dart';

extension ChuckCategoryListModelToChuckCategoryListCM on List<ChuckCategoryCM> {
  List<ChuckCategoryModel> toChuckCategoryModel() =>
      map((item) => ChuckCategoryModel(
            item.title,
          )).toList();
}

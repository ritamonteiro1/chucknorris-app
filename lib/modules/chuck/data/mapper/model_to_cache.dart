import '../../domain/model/category/chuck_category_model.dart';
import '../cache/model/chuck_category_cm.dart';

extension ChuckCategoryListModelToChuckCategoryListCM
    on List<ChuckCategoryModel> {
  List<ChuckCategoryCM> toChuckCategoryCM() => map((item) => ChuckCategoryCM(
        item.title,
      )).toList();
}

import 'package:chuck_norris_app/modules/chuck/data/cache/model/chuck_category_cm.dart';
import 'package:chuck_norris_app/modules/chuck/domain/model/category/chuck_category_model.dart';

extension ChuckCategoryListModelToChuckCategoryListCM
    on List<ChuckCategoryModel> {
  List<ChuckCategoryCM> toChuckCategoryCM() => map((item) => ChuckCategoryCM(
        item.title ?? ' - ',
      )).toList();
}

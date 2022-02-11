import '../../../domain/exception/null_chuck_category_list_cm_exception.dart';

import '../model/chuck_category_cm.dart';
import 'package:hive/hive.dart';

import '../../../domain/model/category/chuck_category_model.dart';
import '../../mapper/cache_to_model.dart';
import '../../mapper/model_to_cache.dart';
import 'chuck_cache_data_source.dart';

class ChuckCacheDataSourceImpl implements ChuckCacheDataSource {
  ChuckCacheDataSourceImpl({
    required HiveInterface hive,
  }) : _hive = hive;

  final HiveInterface _hive;
  static const _chuckCategoryListKeyString = 'chuckCategoryListKeyString';
  static const _chuckCategoryListKeyInt = 0;

  @override
  Future<List<ChuckCategoryModel>> getChuckCategoryList() async {
    final box = await Hive.openBox(_chuckCategoryListKeyString);
    if (box.isNotEmpty) {
      final chuckCategoryListCM =
          List<ChuckCategoryCM>.from(box.get(_chuckCategoryListKeyInt));
      return chuckCategoryListCM.toChuckCategoryModel();
    } else {
      throw NullChuckCategoryListCMException();
    }
  }

  @override
  Future<void> saveChuckCategoryList(
      List<ChuckCategoryModel> chuckCategoryListModel) async {
    final chuckCategoryListCM = chuckCategoryListModel.toChuckCategoryCM();
    final box = await _hive.openBox(_chuckCategoryListKeyString);
    await box.putAll({_chuckCategoryListKeyInt: chuckCategoryListCM});
  }
}

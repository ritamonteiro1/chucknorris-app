import '../../data/remote/data_source/chuck_remote_data_source.dart';
import '../model/category/chuck_category_model.dart';

import 'chuck_repository.dart';

class ChuckRepositoryImpl implements ChuckRepository {
  ChuckRepositoryImpl(
    this.chuckRemoteDataSource,
  );

  final ChuckRemoteDataSource chuckRemoteDataSource;

  @override
  Future<List<ChuckCategoryModel>> getChuckCategoryList() =>
      chuckRemoteDataSource.getChuckCategoryList();
}

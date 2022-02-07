import 'package:chuck_norris_app/domain/model/category/chuck_category_model.dart';
import 'package:chuck_norris_app/domain/repository/chuck_repository.dart';

import 'get_chuck_category_list_use_case.dart';

class GetChuckCategoryListUseCaseImpl implements GetChuckCategoryListUseCase {
  GetChuckCategoryListUseCaseImpl(
    this.chuckRepository,
  );

  final ChuckRepository chuckRepository;

  @override
  Future<List<ChuckCategoryModel>> getChuckCategoryList(
          {required String category}) =>
      chuckRepository.getChuckCategoryList(category: category);
}

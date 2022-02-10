import '../model/joke/chuck_joke_model.dart';
import '../repository/chuck_repository.dart';

import 'get_chuck_category_joke_use_case.dart';

class GetChuckCategoryJokeUseCaseImpl implements GetChuckCategoryJokeUseCase {
  GetChuckCategoryJokeUseCaseImpl({
    required ChuckRepository chuckRepository,
  }) : _chuckRepository = chuckRepository;
  final ChuckRepository _chuckRepository;

  @override
  Future<ChuckJokeModel> call({required String chuckCategory}) =>
      _chuckRepository.getChuckJoke(chuckCategory: chuckCategory);
}

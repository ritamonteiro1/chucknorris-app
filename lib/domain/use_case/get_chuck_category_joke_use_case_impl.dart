import '../model/joke/chuck_joke_model.dart';
import '../repository/chuck_repository.dart';

import 'get_chuck_category_joke_use_case.dart';

class GetChuckCategoryJokeUseCaseImpl implements GetChuckCategoryJokeUseCase {
  GetChuckCategoryJokeUseCaseImpl(
    this.chuckRepository,
  );

  final ChuckRepository chuckRepository;

  @override
  Future<ChuckJokeModel> getChuckJoke({required String chuckCategory}) =>
      chuckRepository.getChuckJoke(chuckCategory: chuckCategory);
}

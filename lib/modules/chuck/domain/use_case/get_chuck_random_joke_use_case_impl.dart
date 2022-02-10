import '../model/joke/chuck_joke_model.dart';
import '../repository/chuck_repository.dart';

import 'get_chuck_random_joke_use_case.dart';

class GetChuckRandomJokeUseCaseImpl implements GetChuckRandomJokeUseCase {
  GetChuckRandomJokeUseCaseImpl({
    required ChuckRepository chuckRepository,
  }) : _chuckRepository = chuckRepository;

  final ChuckRepository _chuckRepository;

  @override
  Future<ChuckJokeModel> call() => _chuckRepository.getChuckRandomJoke();
}

import '../../domain/model/category/chuck_category_model.dart';
import '../../domain/model/joke/chuck_joke_model.dart';
import '../remote/model/category/chuck_category_response.dart';
import '../remote/model/joke/chuck_joke_response.dart';

extension ChuckCategoryListResponseToChuckCategoryListModel
    on List<ChuckCategoryResponse> {
  List<ChuckCategoryModel> toChuckCategoryModel() =>
      map((item) => ChuckCategoryModel(
            item.title ?? ' - ',
          )).toList();
}

extension ChuckJokeResponseToChuckJokeModel on ChuckJokeResponse {
  ChuckJokeModel toChuckJokeModel() => ChuckJokeModel(
        id ?? ' - ',
        iconUrl ?? ' - ',
        url ?? ' - ',
        joke ?? ' - ',
      );
}

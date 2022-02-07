import '../../domain/model/category/chuck_category_model.dart';
import '../../domain/model/joke/chuck_joke_model.dart';
import '../remote/model/category/chuck_category_list_response.dart';
import '../remote/model/joke/chuck_joke_response.dart';

extension ChuckCategoryListResponseToChuckCategoryModel
    on ChuckCategoryListResponse {
  List<ChuckCategoryModel> toChuckCategoryModel() => chuckCategoryList
      .map(
        (item) => ChuckCategoryModel(item.title ?? ' - '),
      )
      .toList();
}

extension ChuckJokeResponseToChuckJoseModel on ChuckJokeResponse {
  ChuckJokeModel toChuckJokeModel() => ChuckJokeModel(
        id ?? ' - ',
        icon_url ?? ' - ',
        url ?? ' - ',
        value ?? ' - ',
      );
}

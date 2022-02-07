import 'package:json_annotation/json_annotation.dart';

import 'chuck_category_response.dart';

part 'chuck_category_list_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChuckCategoryListResponse {
  ChuckCategoryListResponse(
    this.categories,
  );

  factory ChuckCategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$ChuckCategoryListResponseFromJson(json);

  final List<ChuckCategoryResponse> categories;

  Map<String, dynamic> toJson() => _$ChuckCategoryListResponseToJson(this);
}

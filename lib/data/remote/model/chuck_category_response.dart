import 'package:json_annotation/json_annotation.dart';

part 'chuck_category_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChuckCategoryResponse {
  ChuckCategoryResponse(
    this.title,
  );

  factory ChuckCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ChuckCategoryResponseFromJson(json);

  final String? title;

  Map<String, dynamic> toJson() => _$ChuckCategoryResponseToJson(this);
}

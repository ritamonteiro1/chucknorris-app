import 'package:json_annotation/json_annotation.dart';

part 'chuck_joke_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChuckJokeResponse {
  ChuckJokeResponse(
    this.id,
    this.icon_url,
    this.url,
    this.value,
  );
  factory ChuckJokeResponse.fromJson(Map<String, dynamic> json) =>
      _$ChuckJokeResponseFromJson(json);
  final String? id;
  final String? icon_url;
  final String? url;
  final String? value;

  Map<String, dynamic> toJson() => _$ChuckJokeResponseToJson(this);
}

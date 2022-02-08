import 'package:json_annotation/json_annotation.dart';

part 'chuck_joke_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChuckJokeResponse {
  ChuckJokeResponse(
    this.id,
    this.iconUrl,
    this.url,
    this.joke,
  );
  factory ChuckJokeResponse.fromJson(Map<String, dynamic> json) =>
      _$ChuckJokeResponseFromJson(json);
  final String? id;
  @JsonKey(name: 'icon_url')
  final String? iconUrl;
  final String? url;
  @JsonKey(name: 'value')
  final String? joke;

  Map<String, dynamic> toJson() => _$ChuckJokeResponseToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chuck_joke_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChuckJokeResponse _$ChuckJokeResponseFromJson(Map<String, dynamic> json) =>
    ChuckJokeResponse(
      json['id'] as String?,
      json['icon_url'] as String?,
      json['url'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$ChuckJokeResponseToJson(ChuckJokeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon_url': instance.iconUrl,
      'url': instance.url,
      'value': instance.joke,
    };

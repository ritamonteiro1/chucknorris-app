// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chuck_category_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChuckCategoryListResponse _$ChuckCategoryListResponseFromJson(
        Map<String, dynamic> json) =>
    ChuckCategoryListResponse(
      (json['categories'] as List<dynamic>)
          .map((e) => ChuckCategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChuckCategoryListResponseToJson(
        ChuckCategoryListResponse instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

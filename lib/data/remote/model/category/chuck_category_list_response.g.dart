// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chuck_category_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChuckCategoryListResponse _$ChuckCategoryListResponseFromJson(
        Map<String, dynamic> json) =>
    ChuckCategoryListResponse(
      (json['chuck_category_list'] as List<dynamic>)
          .map((e) => ChuckCategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChuckCategoryListResponseToJson(
        ChuckCategoryListResponse instance) =>
    <String, dynamic>{
      'chuck_category_list': instance.chuckCategoryList,
    };

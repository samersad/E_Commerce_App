// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_favorite_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToFavoriteDto _$AddToFavoriteDtoFromJson(Map<String, dynamic> json) =>
    AddToFavoriteDto(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AddToFavoriteDtoToJson(AddToFavoriteDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
